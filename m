Return-Path: <ksummit+bounces-1055-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D678422E
	for <lists@lfdr.de>; Tue, 22 Aug 2023 15:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BEBE1C20B06
	for <lists@lfdr.de>; Tue, 22 Aug 2023 13:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9979A1CA00;
	Tue, 22 Aug 2023 13:37:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0147F
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 13:37:34 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d712d86eb96so4084261276.3
        for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692711453; x=1693316253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C606uuUpSYJFNSQZG00xV98rnJ+iBpRSVOquWX+rjL0=;
        b=eI8zXq8mSJiYf7Xa8OCOfRlCJ/LO+xMCKBiwsoPG706Ji6zknd4L/PI6Wn4hEzsbU5
         49AvtpnLLKv5Cfq11A5zIyG1M71O0R6YKUBrBxmQRXNwoO6+keJY+wEj6rVYD+4JiaQx
         jS0xM7puxxwk6egmwfptiE49XxLRinj6inN6z8dzD/9VPHnidot9rJREQ2XVnvppptIl
         GupxNx92gQ1SbgsiH5SBDze6Zki0I0ym010HJfUVtB5TIaLJA18hQU910C3DoIqYIuID
         YoFy23y4LbEKvBxVHL3TTmi33yGM+D6VWXrTNLz5MdpSF5bXVbCJfR8c/CuX8+VEjTYr
         bsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692711453; x=1693316253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C606uuUpSYJFNSQZG00xV98rnJ+iBpRSVOquWX+rjL0=;
        b=bPeDBx9Tq1rDZNCZ5+KudhvBev5Pu8NJXqHp4GL0WgToPJz6w5KHRtx4owveDGvT0w
         3AdhWSklAIQOKL97Mxi0Xp0A1bPqjDoPCrj6M723ta7qeO6HR4t1HhNMgftkZQE05gph
         H0fO2lmSsYHydO9xDbodH/V+qtJ4pMU2S4Q3hjBqJapCXHQZWiVN0N/XgwzFavIj3/sU
         ZnEW9VE6dqTBhdClwe1o/XLdvJp3DnXCdYAGx0w9fsvwDq9vPai7/zJ3PBVu7pOEkXhv
         Ary5umKlF5ZSFJGpu98bqcW1cYaVSSCikLwzweAvE3wqPUGALGlEt+sS4thKx7ZIKNkp
         kurg==
X-Gm-Message-State: AOJu0YwkhRJlNB/i9cE9w1T8HSP8sZWACdUn+ZSKZfp5jBmvPlT2/qdl
	ycMlQhfwUIwy5SCOE1ehLC6nvAwmryamOGt8P4u1Tg==
X-Google-Smtp-Source: AGHT+IELrajRvHqvaYE0UHfTT2/iuqTSk0+eMG8XS/sLh5BWPntIKEpacAciv8nNpUJMlwHRG8y5shAAmO5Jh99tHus=
X-Received: by 2002:a25:234e:0:b0:d12:bae1:f324 with SMTP id
 j75-20020a25234e000000b00d12bae1f324mr8713286ybj.18.1692711453466; Tue, 22
 Aug 2023 06:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <64e404a979f54_4c1f3294d3@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <2023082250-replace-rectangle-1d47@gregkh>
In-Reply-To: <2023082250-replace-rectangle-1d47@gregkh>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Aug 2023 15:37:21 +0200
Message-ID: <CACRpkdZWoyGfDdG=6aULDhvwYDF829yqK-u9wp563R+E+SWOtw@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Between a rock and a hard place, managing expectations...
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Dan wrote:

> Standardization helps, but there is often a "system-software
> implementation-specific" gap that a standard leaves for an operating
> system to resolve. Linux is nowadays a first mover, and a primary
> deployment target.

When we designed pin control, I first made an iteration which we had
to throw away, keeping the old quote from "the mythical man-month"
in mind, "always count on throwing one version away". The same
happened with the GPIO character device. v2 looks good. We need
to realize at least from what I've seen, that Fred Brooks was right
about this.

Always having to throw the first version away is the most obvious
pattern that we should always expect, yet fail repeatedly to account
for and always get annoyed at. Why? It is expected.

Greg wrote:

 Why not have the community "fight it out" among themselves first, before
> we have to worry about it?

We can be a bit proactive with this, but it's more of elusive
entrepreneurship or magical coincidence when we do, and the
work happens seemingly unorganized.

The v2 pin control was designed in a conference room at the Embedded
Linux Conference in San Diego 2012 I think. nVidia, Texas Instruments and
Renesas were there, possibly more. We had a whiteboard. That
ended up with with the lines hooking it up in drivers/base/dd.c and that
is still the core behaviour.

It wasn't a fight, more like a good version of committee work, like a
committee without any prestige.

Collect the key people in the same geographical location and talk
it over, magic happens. Sometimes, at least. It's worth a try.

Yours,
Linus Walleij

