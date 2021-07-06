Return-Path: <ksummit+bounces-254-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 986463BDCB3
	for <lists@lfdr.de>; Tue,  6 Jul 2021 20:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 3A5F83E10E1
	for <lists@lfdr.de>; Tue,  6 Jul 2021 18:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40E62F80;
	Tue,  6 Jul 2021 18:09:15 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A61772
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 18:09:14 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id n14so39862595lfu.8
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 11:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O6rAeDSPFllCcuoeipogSy52xSeUY26YtkQRKOO+L6E=;
        b=tRcLELR+cpKTXxjjR2bVHhPcCFYxlILPfNQyz8Lb7RWSMDUYLi1LxQXJu4+Pyhm4df
         hEcH15UzKP+Vvn2Ul2KKT6XM6Nq2aJH3uTpFBNi6A3+vfvbcvHxUzAETE4Rm/QcmSN7a
         x3+mbEYGgTFDTpDmc0PGQKGx2zcuHEulbj44xwBFn5nfUjDC/FG1G8Qdhh0spw98HS5l
         q62z3KOgyghu9U7TV12BChhJqGc8hbJM39RO138vHNVNJU9xqlfU56OsiuswOs98BdVX
         JiT8ifk5PXEMXidmsecEQy6WKXzxVfBH6iUjKjiAcBFE2wVkD+XJYUaXV9mGzrMChk9D
         LrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O6rAeDSPFllCcuoeipogSy52xSeUY26YtkQRKOO+L6E=;
        b=e+CqCPzEHKJpgGDlJMfgpr8QGyYInE+M7EinKWT4PN07l5zS5NEDHK8U10qaKQZOOw
         AMmZ+Quo1dmrye/KrMhVerutB85ceSGHta5CsmMGvSx1vo2ZmDkLU5i71B25CPvUdxmx
         VbxRbyaIDVIMYzesM7DFYi7TV98oT0IHkNmgyTnXxjIvpEO71q8JmS7rDIEtV0sgLeR/
         zRrKTqncPoSWa8AUZBmPOPAyRQ3r+jSba5Gz2B8CqoqyZwuK7L8iVlWXLSK3O8RKu6NW
         ebv0kw2lePm5eVsCWrSYzwgRKeSz8sl2H5B//DXMEDhARFI6rPo8yXvKcSPNjs4APgJF
         UJWg==
X-Gm-Message-State: AOAM5325K/shFbdT2I0Zb2m5aM/L6qR7RH+M8ZnXe8CrIU4ReXk6rs6m
	j+p833qlFIpgn+2JENVDx3WOuMjiNbC8RS4fGVLuIMnnBh0=
X-Google-Smtp-Source: ABdhPJwg1p/wNXRzNEtnme9kcZsDPtoOBMXRqr5lm4gDDKPENIqPkdj7ysj1jdyDKikbh3bUkLwLqVybPKyrgiqltrY=
X-Received: by 2002:a05:6512:1508:: with SMTP id bq8mr16103111lfb.529.1625594952455;
 Tue, 06 Jul 2021 11:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <19e0f737a3e58ed32758fb4758393c197437e8de.camel@HansenPartnership.com>
In-Reply-To: <19e0f737a3e58ed32758fb4758393c197437e8de.camel@HansenPartnership.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Jul 2021 20:09:01 +0200
Message-ID: <CACRpkdaoGEVwjh902_r=KA=dnPu-vdbKe-xXiLbdjLR1-DqQ0w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Leon Romanovsky <leon@kernel.org>, "a. Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 12:20 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:

> 3. Less review: The lack of kernel programmers understanding rust
> hampers reviewing.  Since most of our CVE type problems are usually
> programming mistakes nowadays, the lack of review could contribute to
> an increase in programming fault type bugs which aren't forbidden by
> the safer memory model.

The rationale not stated explicitly by the Rust enthusiasts is based
on the assumption that the language has a broad uptake and that
the crowd of developers embracing Rust will increase over time,
and especially that new young, fresh developers will know Rust
better than C.

If over time this becomes (by assumption) an increasing crowd of
Rust-interested developers who think C is primitive and last years
news and do not want to work with it, then the assumption is true.

This has limited evidence but is I think based on StackOverflow
surveys of "most loved language" and such. Overall the people
promoting Rust believe in this and they also apparently feel a strong
sense of belonging wrt the language.

I think it is a fair reason. Any push into any new technology needs to
be driven by belief and enthusiasm, i.e. emotions. That's fine. Such
was Unix and C, and such was Linux, too. Not everything is rational.

Yours,
Linus Walleij

