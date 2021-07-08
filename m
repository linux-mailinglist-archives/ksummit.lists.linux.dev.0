Return-Path: <ksummit+bounces-329-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AFE3BF58E
	for <lists@lfdr.de>; Thu,  8 Jul 2021 08:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 4F2C73E1066
	for <lists@lfdr.de>; Thu,  8 Jul 2021 06:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95BB2F80;
	Thu,  8 Jul 2021 06:26:26 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A9570
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 06:26:25 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id i94so6015929wri.4
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 23:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XnYqQH/GTAUwbvqZF5nKUAYYFJ5tRBarkbmoQg9xCZ0=;
        b=aOl0m5aBDkMOHN+Zp5sG8k2Z8A7cz5AsErvSnFBE/yjcC+NS7rKUuBLQnHlxmwsc62
         emG4laFHQbO6HfAnThhXrDuYcgicXEv9lXGKQRNl83kSicBe1PRwbcMbAAd2cchjKIIG
         kY7HUZMjJ04Oj0gmnGQweJNMOF2Uiicy2FaN/jNFzk+Owfu7u/hZscOk9y0KIsGuLI/C
         8P+2D8WSm+qGes6k8AaQ2mZ7RV4UudWhcq+xZkxpA1RBBQ/eDdNt0gBzz8c/YOsIfh+x
         84YKobfUCl3YJL3Sd9hcT7VtcVd5xZ7OJPfopHU4dOSeeb+B0SfCcOQC1e03D/8+lOdN
         xiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XnYqQH/GTAUwbvqZF5nKUAYYFJ5tRBarkbmoQg9xCZ0=;
        b=qyNvbXSvc4aEuGafL7fOHXMZIOxNi4GNrgM74c5seimzp7/4a4NelWY8yN+vbjqAKu
         mfCv/ygF13aZ7c7ef0MWRaVbzKiKlbfflWCCYHcxVi4eqegNe20F390nq2bOVE/8Gay5
         H0hwApb97Gfk9Wf3xyZrp0NiCfSKKOPfSE9//ZT6WGgjalhgWdrloCrzkmIuTrueswU8
         k/aYW6fvnDatnXdgNdqZdwrVtrsCktU+g/hApOtCVeOb2wiYX0YwD//WGEgB+RScAT5d
         XqXBT6pz2zlYSSewMEGZ2801QpIl7l3fScBGR0dbWob8rVu4Ns8n2oZgaXEvk5toY/Y9
         TPrg==
X-Gm-Message-State: AOAM53261PRUsEz1e+81FOa7y6KTxIR6t5jxg/Dk3PiOd4cBB5JYFl5q
	mBauwCGQUfYfJ6c4gWdQ1g==
X-Google-Smtp-Source: ABdhPJxrqDx6T5HS1opAYuKDEobcw39d5f7KDipYmExHlSnvH7F1NHroyiNlvIZr7oqYdHFo/e/qFg==
X-Received: by 2002:a05:6000:2c2:: with SMTP id o2mr26583161wry.221.1625725584041;
        Wed, 07 Jul 2021 23:26:24 -0700 (PDT)
Received: from localhost.localdomain ([46.53.254.76])
        by smtp.gmail.com with ESMTPSA id l17sm8127078wmq.3.2021.07.07.23.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 23:26:23 -0700 (PDT)
Date: Thu, 8 Jul 2021 09:26:21 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Roland Dreier <roland@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOaajWtcMK5Mjbsr@localhost.localdomain>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <64de6a11-5ff0-9931-d09b-2246cb37b284@acm.org>
 <20210706160857.6d4c63aa@hermes.local>
 <f391c00d-7f4f-a60c-0230-4aca5ea2d4ed@acm.org>
 <CAHk-=wiwZWAo_Ki587FD2BrAQVK71TBN=uKimdBf1Pxg3=+nTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wiwZWAo_Ki587FD2BrAQVK71TBN=uKimdBf1Pxg3=+nTw@mail.gmail.com>

On Wed, Jul 07, 2021 at 11:57:19AM -0700, Linus Torvalds wrote:
> On Tue, Jul 6, 2021 at 7:41 PM Bart Van Assche <bvanassche@acm.org> wrote:
> >
> > As a sidenote, I'm surprised that C++ is not supported for Linux kernel
> > code since C++ supports multiple mechanisms [..]
> 
> You'd have to get rid of some of the complete garbage from C++ for it
> to be usable.
> 
> One of the trivial ones is "new" - not only is it a horribly stupid
> namespace violation, but it depends on exception handling that isn't
> viable for the kernel, so it's a namespace violation that has no
> upsides, only downsides.

"new" is such a non-problem.

"Allocating" new simply doesn't work by default:

	undefined reference to `operator new(unsigned long)'

Class level operator new is deal with by "-fcheck-new" so that constructors
don't run if allocation fails, then the pointer is checked as usual.

Placement "new" can be disabled completely if needed.

> Could we fix it with some kind of "-Dnew=New" trickery?

No, developers will type "new_" and that's basically it.

