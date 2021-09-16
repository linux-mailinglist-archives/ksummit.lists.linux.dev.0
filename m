Return-Path: <ksummit+bounces-600-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBBB40EAC9
	for <lists@lfdr.de>; Thu, 16 Sep 2021 21:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 5734C3E10DD
	for <lists@lfdr.de>; Thu, 16 Sep 2021 19:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7EA3FDC;
	Thu, 16 Sep 2021 19:26:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446B83FC5
	for <ksummit@lists.linux.dev>; Thu, 16 Sep 2021 19:26:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DF9B610E9;
	Thu, 16 Sep 2021 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1631820413;
	bh=cj4YYql3ialFH5a3FIsQKbEh3n2waZxbKmXBYlo5ynk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=wdf67NTnj8bDQNSnGOX2sXk1GF2gDGSOttrakL9aAa7bg20ZWrn1C5mEpcQd9Vw1r
	 K14k1JMqcRv2/wJBiXdHtKJ6WEM8L6rNW8lcAaoV0/6Z5nLmt5E/tjLUeErUhnajMU
	 Rm7FKOONV0I+tiPRTX5DNzKLBHBEXAYdfQ8Q5QwQ=
Date: Thu, 16 Sep 2021 12:26:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Chris Mason
 <clm@fb.com>, Johannes Weiner <hannes@cmpxchg.org>, Kent Overstreet
 <kent.overstreet@gmail.com>, Matthew Wilcox <willy@infradead.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Christoph Hellwig
 <hch@infradead.org>, David Howells <dhowells@redhat.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINER SUMMIT] Folios as a potential Kernel/Maintainers
 Summit topic?
Message-Id: <20210916122652.b6ab789e968263eb4ab31626@linux-foundation.org>
In-Reply-To: <YUOX0VxkO+/1kT7u@mit.edu>
References: <YUIwgGzBqX6ZiGgk@mit.edu>
	<f7b70227bac9a684320068b362d28fcade6b65b9.camel@HansenPartnership.com>
	<YUI5bk/94yHPZIqJ@mit.edu>
	<17242A0C-3613-41BB-84E4-2617A182216E@fb.com>
	<f066615c0e2c6fe990fa5c19dd1c17d649bcb03a.camel@HansenPartnership.com>
	<E655F510-14EB-4F40-BCF8-C5266C07443F@fb.com>
	<33a2000f56d51284e2df0cfcd704e93977684b59.camel@HansenPartnership.com>
	<YUOX0VxkO+/1kT7u@mit.edu>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 16 Sep 2021 15:15:29 -0400 "Theodore Ts'o" <tytso@mit.edu> wrote:

> What typically happens is if someone were to try to play games like
> this inside, say, the Networking subsystem, past a certain point,
> David Miller will just take the patch series, ignoring people who have
> NACK's down if they can't be justified.  The difference is that even
> though Andrew Morton (the titular maintainer for all of Memory
> Management, per the MAINTAINERS file), Andrew seems to have a much
> lighter touch on how the mm subsystem is run.

I do the Dave thing sometimes.  We aren't at that point with folios
though.  The discussions and objections and approvals are all
substantial and things are still playing out.

