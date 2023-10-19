Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E54D7CF0DF
	for <lists@lfdr.de>; Thu, 19 Oct 2023 09:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFE931C20E42
	for <lists@lfdr.de>; Thu, 19 Oct 2023 07:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A155C8E7;
	Thu, 19 Oct 2023 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6203B8F6B
	for <ksummit@lists.linux.dev>; Thu, 19 Oct 2023 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 39J71rZ9000896;
	Thu, 19 Oct 2023 09:01:53 +0200
Date: Thu, 19 Oct 2023 09:01:53 +0200
From: Willy Tarreau <w@1wt.eu>
To: Kees Cook <keescook@chromium.org>
Cc: Christoph Hellwig <hch@lst.de>, Justin Stitt <justinstitt@google.com>,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        ksummit@lists.linux.dev
Subject: Re: the nul-terminated string helper desk chair rearrangement
Message-ID: <ZTDUYSBS7AO9pAgm@1wt.eu>
References: <20231018-strncpy-drivers-nvme-host-fabrics-c-v1-1-b6677df40a35@google.com>
 <20231019054642.GF14346@lst.de>
 <202310182248.9E197FFD5@keescook>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310182248.9E197FFD5@keescook>

On Wed, Oct 18, 2023 at 11:01:54PM -0700, Kees Cook wrote:
> On Thu, Oct 19, 2023 at 07:46:42AM +0200, Christoph Hellwig wrote:
> > On Wed, Oct 18, 2023 at 10:48:49PM +0000, Justin Stitt wrote:
> > > strncpy() is deprecated for use on NUL-terminated destination strings
> > > [1] and as such we should prefer more robust and less ambiguous string
> > > interfaces.
> > 
> > If we want that we need to stop pretendening direct manipulation of
> > nul-terminate strings is a good idea.  I suspect the churn of replacing
> > one helper with another, maybe slightly better, one probably
> > introduces more bugs than it fixes.
> > 
> > If we want to attack the issue for real we need to use something
> > better.
> > 
> > lib/seq_buf.c is a good start for a lot of simple cases that just
> > append to strings including creating complex ones.  Kent had a bunch
> > of good ideas on how to improve it, but couldn't be convinced to
> > contribute to it instead of duplicating the functionality which
> > is a bit sad, but I think we need to switch to something like
> > seq_buf that actually has a counted string instead of all this messing
> > around with the null-terminated strings.
> 
> When doing more complex string creation, I agree. I spent some time
> doing this while I was looking at removing strcat() and strlcat(); this
> is where seq_buf shines. (And seq_buf is actually both: it maintains its
> %NUL termination _and_ does the length counting.) The only thing clunky
> about it was initialization, but all the conversions I experimented with
> were way cleaner using seq_buf.
(...)

I also agree. I'm using several other schemes based on pointer+length in
other projects and despite not being complete in terms of API (due to the
slow migration of old working code), over time it proves much easier to
use and requires far less controls.

With NUL-teminated strings you need to perform checks for each and every
operation. When the length is known and controlled, most often you can
get rid of many tests on intermediate operations and perform a check at
the end, thus you end up with less "if" and "goto fail" in the code,
because the checks are no longer for "not crashing nor introducing
vulnerabilities", but just "returning a correct result", which can often
be detected more easily.

Another benefit I found by accident is that when you need to compare some
tokens against multiple ones (say some keywords for example), it becomes
much faster than strcmp()-based if/else series because in this case you
start by comparing lengths instead of comparing contents. And when your
macros allow you to constify string constants, the compiler will replace
long "if" series with checks against constant values, and may even arrange
them as a tree since all are constants, sometimes mixing with the first
char as the discriminator. Typically on the test below I observe a 10x
speedup at -O3 and ~5x at -O2 when I convert this:

	if (!strcmp(name, "host") ||
	    !strcmp(name, "content-length") ||
	    !strcmp(name, "connection") ||
	    !strcmp(name, "proxy-connection") ||
	    !strcmp(name, "keep-alive") ||
	    !strcmp(name, "upgrade") ||
	    !strcmp(name, "te") ||
	    !strcmp(name, "transfer-encoding"))
		return 1;

to this:

	if (isteq(name, ist("host")) ||
	    isteq(name, ist("content-length")) ||
	    isteq(name, ist("connection")) ||
	    isteq(name, ist("proxy-connection")) ||
	    isteq(name, ist("keep-alive")) ||
	    isteq(name, ist("upgrade")) ||
	    isteq(name, ist("te")) ||
	    isteq(name, ist("transfer-encoding")))
		return 1;

The code is larger but when compiled at -Os, it instead becomes smaller.

Another interesting property I'm using in the API above, that might or
might not apply there is that for most archs we care about, functions
can take a struct of two words passed as registers, and can return
such a struct as a pair of registers as well. This allows to chain
functions by passing one function's return as the argument to another
one, which is what users often want to do to avoid intermediate
variables.

All this to say that length-based strings do offer quite a lot of
benefits over the long term.

Willy

