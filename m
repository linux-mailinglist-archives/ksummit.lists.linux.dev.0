Return-Path: <ksummit+bounces-289-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5DC3BE8FF
	for <lists@lfdr.de>; Wed,  7 Jul 2021 15:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 516A01C0EC3
	for <lists@lfdr.de>; Wed,  7 Jul 2021 13:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7771E2F80;
	Wed,  7 Jul 2021 13:49:25 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA7E70
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 13:49:24 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id z1so2817153ils.0
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 06:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e06Q9d0qectPejPGNeLFcVYz0BBtXDnIL+oWfSRT2tQ=;
        b=YxU3zI5g0a3FlzW7jiAXgkH+N/nHM+mE4ds7M3PCfaZNxrDxlFIm7FBIk8MKPkCrYD
         eEnbebY9ilK4NY9QIc9n7uilKsvit+JCdVkibgKft+4mHwJYBYM7xUg2Bs7L8Sic3PMi
         6SZZ7UO8PokdNqdpmLDyuiOGX9fXXO13h+PDtE2bFadmWHRLc0Wd6rzEa59ZQtAvGzC5
         uC0U0dcGL6UOI5V5By5HvCzXit4Q8lsfVO7jDRAD2wZgN20O1SLSNtnfxRGr5ocqq5S6
         djRcAPVO4v9hNKBEz+xX/of0N//3o3qYXkvGK9F6aZgZpQK72WWiCMXC1mr9dNNULV5N
         KmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e06Q9d0qectPejPGNeLFcVYz0BBtXDnIL+oWfSRT2tQ=;
        b=ah1tuK+NoGw3mjq4joFZP43tssGIKpgR7q7zg+8C0bpCc3YWxkUJtFbKxjgXIynDEC
         HVJ2RN8Yaa+zQ/kzEH8h7uvyJkwyNLYMXu/9ovQuHhxCD0oL+WknsMFx1en8Zjrgg1mT
         hhZoiCc5SV1Gg+vdAI6Izqo18c5+cIpqkOYGXZ+PJ4fRWjDRvhPObIwwai8VUbqAAPmS
         wmlp/EyYfQbSWpKkSf0N+gLFX6Q2bA/LSAD0IcFVHZz/SChgNmhWeBg6T3OZ1eUOmuma
         6krVM39TySipvMRo22w+2mKWAIWdwadwBFVAbEBLbuBWlteA/tq8QTvGkW2IybuH4p0E
         fV2g==
X-Gm-Message-State: AOAM531NIXCVOdCmwH9WsLjnth++OF+K10H3JDvC2w7Hpbf5X60qQyaS
	t3hGNq25VgECA33qIcLpGv9A+qzN5H6bx2MyYM0=
X-Google-Smtp-Source: ABdhPJx1JF/9zbWc1y557iK+xzGYoadexxr/hC95JX6+XmMocFASDcf7FFXaACsyxT1CeWvYzFxnfrAIsUWb3eGA7GI=
X-Received: by 2002:a05:6e02:1d04:: with SMTP id i4mr18428184ila.149.1625665763833;
 Wed, 07 Jul 2021 06:49:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <YOTSYy2J2COzOY9l@pendragon.ideasonboard.com> <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
 <YOVbsS9evoCx0isz@kroah.com> <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
In-Reply-To: <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jul 2021 15:49:12 +0200
Message-ID: <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Greg KH <greg@kroah.com>, Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 9:52 AM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> Rust has a reference counted pointer: Rc<T>.  However the problem is
> the rust memory model is via strict accounting, so once you start using
> refcounts, which need shared accounting, you can then get memory leaks
> and it's unclear if rust actually buys you anything over C for this use
> case.

Even if you are using `Rc<T>`, Rust buys you a *lot*. For starters, it
still prevents UB and data races -- e.g. it prevents mistakenly
sharing the `Rc` with other threads.

Cheers,
Miguel

