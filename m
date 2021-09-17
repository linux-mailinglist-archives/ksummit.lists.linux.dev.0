Return-Path: <ksummit+bounces-608-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D2E40F7EE
	for <lists@lfdr.de>; Fri, 17 Sep 2021 14:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id A62A03E1104
	for <lists@lfdr.de>; Fri, 17 Sep 2021 12:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0132FB6;
	Fri, 17 Sep 2021 12:36:59 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490FC3FC0
	for <ksummit@lists.linux.dev>; Fri, 17 Sep 2021 12:36:58 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id bk29so16881124qkb.8
        for <ksummit@lists.linux.dev>; Fri, 17 Sep 2021 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BhAiNAxekh+7Mk4Iygi3KYU65IFuuL7Kb47IBfGnIfk=;
        b=XYEKyeF3NBbv3oexjiDdpLa1UYdACvkjSdZjJtMcVA2hBLN84ycWkeniyFvaGUdODc
         v93cZBGyQlIukacn7sdoEU6tbrSVnQAS0zzNAg7Vgg3WbgWjQ4x+5PelGf2mm7zAtwI4
         1TPznxdBEAxL5LdBwJJLsCogwEgj8raQylqjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BhAiNAxekh+7Mk4Iygi3KYU65IFuuL7Kb47IBfGnIfk=;
        b=JwapDmNlEUFF9fK1Y7OwYVpBtmakECU1t/b6G4t9yJGanDXP5QVWdRzt57PWiTurra
         DVNkCJdNFv3jkeuXgkdIz77aN+Jh+jD2fS08pnNCB8L6SfgG2oph9OiqTx0weSKztUGv
         3rkUSEkqxb71BxtvbcWQTHlgkiezKvsLmXrHjhejuz0shRGT5DX1mgPv1EzZ1ww4mXO5
         t01lnm5ycK5a94KOBO8p1iE/iQtrSwwx2rX9K6110XRTdLFbJZ7OFFjLEqncKE7kdXaW
         f1qG7IT08Ua6c0uxHlZGXqRaN5Fnxivhv2JlZBcgFbRAkJiTLu+E6TCtYfG9rMYXm0Fr
         kgyw==
X-Gm-Message-State: AOAM532Kug4K/MdBX1YKQiqvY0+11w1oRui9x4e/2TdvjVQt+Y7jsDTt
	gAqacwZq0LcZfGUBBGZOAu6U/Q==
X-Google-Smtp-Source: ABdhPJzZAaopSRBJzCpDjUAffjFDI4E1KmOJQ2MtKxVGVsqIikUweblxv4vWt7BBaPgSNtXZ5dlN8g==
X-Received: by 2002:a05:620a:799:: with SMTP id 25mr10319005qka.119.1631882217154;
        Fri, 17 Sep 2021 05:36:57 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id d129sm4583358qkf.136.2021.09.17.05.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:36:56 -0700 (PDT)
Date: Fri, 17 Sep 2021 08:36:54 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Chris Mason <clm@fb.com>, Theodore Ts'o <tytso@mit.edu>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	David Howells <dhowells@redhat.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINER SUMMIT] Folios as a potential Kernel/Maintainers
 Summit topic?
Message-ID: <20210917123654.73sz5p2yjtd3a2np@meerkat.local>
References: <YUIwgGzBqX6ZiGgk@mit.edu>
 <f7b70227bac9a684320068b362d28fcade6b65b9.camel@HansenPartnership.com>
 <YUI5bk/94yHPZIqJ@mit.edu>
 <17242A0C-3613-41BB-84E4-2617A182216E@fb.com>
 <f066615c0e2c6fe990fa5c19dd1c17d649bcb03a.camel@HansenPartnership.com>
 <E655F510-14EB-4F40-BCF8-C5266C07443F@fb.com>
 <33a2000f56d51284e2df0cfcd704e93977684b59.camel@HansenPartnership.com>
 <261D65D8-7273-4884-BD01-2BF8331F4034@fb.com>
 <20210916210046.ourwrk6uqeisi555@meerkat.local>
 <f8561816ab06cedf86138a4ad64e7ff7b33e2c07.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f8561816ab06cedf86138a4ad64e7ff7b33e2c07.camel@HansenPartnership.com>

On Fri, Sep 17, 2021 at 07:14:11AM -0400, James Bottomley wrote:
> > I would caution that Google docs aren't universally accessible. China
> > blocks access to many Google resources, and now Russia purportedly
> > does the same. Perhaps a similar effect can be reached with a git
> > repository with limited commit access? At least then commits can be
> > attested to individual authors.
> 
> In days of old, when knights were bold and cloud silos weren't
> invented, we had an ancient magic handed down by the old gods who spoke
> non type safe languages.  They called it wiki and etherpad ... could we
> make use of such tools today without committing heresy against our
> cloud overlords?

You mean, like https://pad.kernel.org ? :)

However, a large part of why I was suggesting a git repo is because it is
automatically redistributable, clonable, and verifiable using builtin git
tools. We have end-to-end attestation with git, but we don't have it with
etherpad or a wiki. If the goal is to use a document that solicits acks and
other input across subsystems, then having a tamper-evident backend may be
important.

-K

