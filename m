Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A037CF72D
	for <lists@lfdr.de>; Thu, 19 Oct 2023 13:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21850281E8F
	for <lists@lfdr.de>; Thu, 19 Oct 2023 11:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470101A734;
	Thu, 19 Oct 2023 11:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/tdcFjC"
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90EC199A5
	for <ksummit@lists.linux.dev>; Thu, 19 Oct 2023 11:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9be3b66f254so888990166b.3
        for <ksummit@lists.linux.dev>; Thu, 19 Oct 2023 04:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697715655; x=1698320455; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BQbYmJmwIs6r+Dbv/KSZdaRjCezMRBGYvovR08iAwH0=;
        b=a/tdcFjCMN7yjvAzvK+y7CP3vHF9cg/NpmYLgdWKrCluK5q7R+2LiPdFMfjVtVgF/Q
         6+dZxtY34S9cjjO4rc5/2N3CsiV84OYralzmniy21F9WeMgW4G2XSrPV30QN3uSVJ7OX
         JQYpJ5YjA2W9wsQvO8AokwyLDpFw8wRHk8McxMiNe0cijt1hlsoJHkFB2SiszitNngWM
         aMwT8pVeiMHFLL325GhE1mXJESp4BtnNDKUGP34q6WzE6IqoB76khnOVU5ZsoLUdQA49
         nyPCtgY9miCFoftBwLLgap0N1ry51P5K5A/iiFGfoedJeYOlGH59Bm7BszLPSy4vyiB7
         f9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697715655; x=1698320455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQbYmJmwIs6r+Dbv/KSZdaRjCezMRBGYvovR08iAwH0=;
        b=dnwDuiGmipiB2uyDu+IKEZ87J+oZNHo+0GKoE7cQMHo+kJpP4d0TKL1v7Yd4A8aReP
         fkbZnXa/9AH19c/CcP1/vy89Mb16jEsrNMq5ylEnUGiP4+JwB8IBedVQ2JcGkoqFQNSF
         8d0ei5WUMVWYA/5jIdHooUg0jxSuYd8q5hGOnWjVTuDSZhcugDADR3VUnLj8ksNMmbsF
         thkGeR9HSjiVBm7DT+TqUZhAP2nM8q16TmON9jXZMe+X2Qfth1GP2YML2M+l98hHgV96
         etgcuwpmWlJon2porzwNHacCITLKymIs+1O0YnrRNGcsb7EOtrwTCZTmBisKtp/wew7F
         HA+Q==
X-Gm-Message-State: AOJu0YyR2Ug2TyBqIu1PqCF3OBauDLEQFbkaosVeCLXIlCY6v3qTGGFo
	1z4NyRXiTgTyClLTt3ypYA==
X-Google-Smtp-Source: AGHT+IEeA1tO05DglDmd90NPT5dBRNdiwc7EdZy0bFNJpeP4Kun43dIdtjhTHzs4e3AkFQBwvevGfg==
X-Received: by 2002:a17:906:d552:b0:9c6:64be:a3c9 with SMTP id cr18-20020a170906d55200b009c664bea3c9mr1425251ejc.39.1697715654778;
        Thu, 19 Oct 2023 04:40:54 -0700 (PDT)
Received: from p183 ([46.53.252.19])
        by smtp.gmail.com with ESMTPSA id v15-20020a17090651cf00b009a168ab6ee2sm3362348ejk.164.2023.10.19.04.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 04:40:54 -0700 (PDT)
Date: Thu, 19 Oct 2023 14:40:52 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Kees Cook <keescook@chromium.org>, Christoph Hellwig <hch@lst.de>,
	Justin Stitt <justinstitt@google.com>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: the nul-terminated string helper desk chair rearrangement
Message-ID: <50ad206e-8a6a-4223-8050-0880e2b1581c@p183>
References: <20231018-strncpy-drivers-nvme-host-fabrics-c-v1-1-b6677df40a35@google.com>
 <20231019054642.GF14346@lst.de>
 <202310182248.9E197FFD5@keescook>
 <ZTDUYSBS7AO9pAgm@1wt.eu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZTDUYSBS7AO9pAgm@1wt.eu>

On Thu, Oct 19, 2023 at 09:01:53AM +0200, Willy Tarreau wrote:
> On Wed, Oct 18, 2023 at 11:01:54PM -0700, Kees Cook wrote:
> > On Thu, Oct 19, 2023 at 07:46:42AM +0200, Christoph Hellwig wrote:
> > > On Wed, Oct 18, 2023 at 10:48:49PM +0000, Justin Stitt wrote:
> > > > strncpy() is deprecated for use on NUL-terminated destination strings
> > > > [1] and as such we should prefer more robust and less ambiguous string
> > > > interfaces.
> > > 
> > > If we want that we need to stop pretendening direct manipulation of
> > > nul-terminate strings is a good idea.  I suspect the churn of replacing
> > > one helper with another, maybe slightly better, one probably
> > > introduces more bugs than it fixes.
> > > 
> > > If we want to attack the issue for real we need to use something
> > > better.
> > > 
> > > lib/seq_buf.c is a good start for a lot of simple cases that just
> > > append to strings including creating complex ones.  Kent had a bunch
> > > of good ideas on how to improve it, but couldn't be convinced to
> > > contribute to it instead of duplicating the functionality which
> > > is a bit sad, but I think we need to switch to something like
> > > seq_buf that actually has a counted string instead of all this messing
> > > around with the null-terminated strings.
> > 
> > When doing more complex string creation, I agree. I spent some time
> > doing this while I was looking at removing strcat() and strlcat(); this
> > is where seq_buf shines. (And seq_buf is actually both: it maintains its
> > %NUL termination _and_ does the length counting.) The only thing clunky
> > about it was initialization, but all the conversions I experimented with
> > were way cleaner using seq_buf.
> (...)
> 
> I also agree. I'm using several other schemes based on pointer+length in
> other projects and despite not being complete in terms of API (due to the
> slow migration of old working code), over time it proves much easier to
> use and requires far less controls.
> 
> With NUL-teminated strings you need to perform checks for each and every
> operation. When the length is known and controlled, most often you can
> get rid of many tests on intermediate operations and perform a check at
> the end, thus you end up with less "if" and "goto fail" in the code,
> because the checks are no longer for "not crashing nor introducing
> vulnerabilities", but just "returning a correct result", which can often
> be detected more easily.
> 
> Another benefit I found by accident is that when you need to compare some
> tokens against multiple ones (say some keywords for example), it becomes
> much faster than strcmp()-based if/else series because in this case you
> start by comparing lengths instead of comparing contents. And when your
> macros allow you to constify string constants, the compiler will replace
> long "if" series with checks against constant values, and may even arrange
> them as a tree since all are constants, sometimes mixing with the first
> char as the discriminator. Typically on the test below I observe a 10x
> speedup at -O3 and ~5x at -O2 when I convert this:
> 
> 	if (!strcmp(name, "host") ||
> 	    !strcmp(name, "content-length") ||
> 	    !strcmp(name, "connection") ||
> 	    !strcmp(name, "proxy-connection") ||
> 	    !strcmp(name, "keep-alive") ||
> 	    !strcmp(name, "upgrade") ||
> 	    !strcmp(name, "te") ||
> 	    !strcmp(name, "transfer-encoding"))
> 		return 1;
> 
> to this:
> 
> 	if (isteq(name, ist("host")) ||
> 	    isteq(name, ist("content-length")) ||
> 	    isteq(name, ist("connection")) ||
> 	    isteq(name, ist("proxy-connection")) ||
> 	    isteq(name, ist("keep-alive")) ||
> 	    isteq(name, ist("upgrade")) ||
> 	    isteq(name, ist("te")) ||
> 	    isteq(name, ist("transfer-encoding")))
> 		return 1;
> 
> The code is larger but when compiled at -Os, it instead becomes smaller.
> 
> Another interesting property I'm using in the API above, that might or
> might not apply there is that for most archs we care about, functions
> can take a struct of two words passed as registers, and can return
> such a struct as a pair of registers as well. This allows to chain
> functions by passing one function's return as the argument to another
> one, which is what users often want to do to avoid intermediate
> variables.

Chaining should be nice cherry on top for very specific cases but certainly
not promoted or advertised. Deleting intermediate variables promotes
implementation-defined behaviour because of unspecified order of evaluation
of function arguments. Second, debuggers still operate with lines in mind,
so jumping to the next statement written like this

	f(g(), h())

can be problematic. Intermediate variables are much less of a problem now
that -Wdeclaration-after-statement has been finally abolished! They don't
consume LOC anymore.

> All this to say that length-based strings do offer quite a lot of
> benefits over the long term.

As long as they are named kstring :-) Or std_string, he-he.

