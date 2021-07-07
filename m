Return-Path: <ksummit+bounces-303-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEAD3BECBF
	for <lists@lfdr.de>; Wed,  7 Jul 2021 19:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 48A251C0ED8
	for <lists@lfdr.de>; Wed,  7 Jul 2021 17:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAD129D6;
	Wed,  7 Jul 2021 17:02:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5B32F80
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 17:02:05 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id e13so3617152ilc.1
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 10:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6wr2j768lwUCPJZmZartrywYg/DAAXf5jfmAABMAmTw=;
        b=mkRehpBDFFTTuD9L6UiizfBCZL4DDbFR7OR23Pj7HyqO4857IWGvXN18enbr1yrTQM
         DcS+BCbKY61VBcPOwhnUySvBTS9ozqFmWTJ9WE7+T5DH5D+x/2VcLD+bX8zThkRyOhnw
         KDBuWTWqBHI4+bu/FHmbJsfGHu8vSSQykpPt7L3SXt95Czsg0JZaojCbnrdBhe76+V9l
         6E7H9walL5mncEDJYu397sseMXHYXyIC0d0rUATnCm1P5bitFX2E2qBWlTi41hKnI5oq
         jS5AkXmOZT+N8UCDoLnUfEvnLgqA/gCBKqaE2c6H5s/zVUWh8dNGFha0eTnKvTvRIU8D
         8z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6wr2j768lwUCPJZmZartrywYg/DAAXf5jfmAABMAmTw=;
        b=WC7TFB9xb9Ln43sLeypONEB4qBV2l7pL+U6Z8uZo8/cEf9D92Zj45sVNVCWx/9vRlh
         dOdHryL2vz8lUD+lhPaWmA5ss/XSAdz6AcLd6ekRBlBwsTJAyCtuqKz2ZUZ6vpeByRUh
         M/qZfzYQUf8Xemd0KirASoBlgmyCealwddGnrUHFZ0BsLDkbCErTx7fEgCYe2FCNqYoQ
         NEFRkcpPhZxd/+nwH0liXpYe3g+xSPRtsbTA/wnbMarNsnD8yk7VaW7B5JwHpvOJGWAK
         DWjdVH6Jjs6eRXD5yJTTA5t2+FjKuzjsP7SYHGeO+Xe4Pt/tMjzGJFtagfz0a635U8J1
         d7Fw==
X-Gm-Message-State: AOAM530dSxOVBaWEFKfZglb0//uohMjPEcTUqxQd55HY5+wCJ9bK9O/M
	g6iWXULCOFnAfbjoLwo2S5oyUbaSnuf22ASs+dg=
X-Google-Smtp-Source: ABdhPJwMpQx+j8/ZCge7LayPKEb/llo7S1MsDOJpbCUXHgTbBoqGeYLg/fhK0jpDEcgt44U5i5vcP0JTen6fMhX11D8=
X-Received: by 2002:a05:6e02:b46:: with SMTP id f6mr19774010ilu.94.1625677324453;
 Wed, 07 Jul 2021 10:02:04 -0700 (PDT)
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
In-Reply-To: <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jul 2021 19:01:53 +0200
Message-ID: <CANiq72ndSJA3XJc61KLQc-ooyFz8qGJfw3oSEG0Yft2tX8zjBA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 9:27 AM Julia Lawall <julia.lawall@inria.fr> wrote:
>
> Where should the free have been?  Will Rust help in this case?  Will it
> result in a memory leak?

If the unsafe code is sound (which it should be -- otherwise we
consider it a bug), then we cannot have UB in Rust, so no crashes due
to memory corruption etc.

However, note that memory leaks are *not* UB -- you can definitely
leak memory in Rust.

Now, whether our abstractions should be thin and e.g. just call devres
primitives or instead write something else from scratch, is an open
question. The latter may lead to easier/faster code in the Rust side,
since it would give us more freedom. But, of course, we understand if
people prefer us to reuse as much C APIs as possible, like e.g. we did
with the red-black trees vs. using `alloc`'s `BTreeMap`.

Cheers,
Miguel

