Return-Path: <ksummit+bounces-324-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C433BF263
	for <lists@lfdr.de>; Thu,  8 Jul 2021 01:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 5A58F3E0F9F
	for <lists@lfdr.de>; Wed,  7 Jul 2021 23:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10D22FAD;
	Wed,  7 Jul 2021 23:22:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41B470
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 23:22:07 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id g3so4729745ilj.7
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 16:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dUhXuQoQxDCt98REQjfdlcmSqAovKMbEPpFNEVvZ0S8=;
        b=fAlRd/45dl+Cq3AmXTgJ6j/qRw15eQZNIZule/klOTPPfnNumjHv9aCCfa4myCkw7O
         s48BpqRokjwz7snmxQ8wQHDrs5kjZNZJQlRkAFLif0Y8Z/15SW/kSUGWc9gLYf2voqB/
         6e0RT+EmHLpp+eOjRduz1/oSdK4yBgqtEdjdqW6Zq35diSAF+dbrv2DhOaZPzV9VFHMd
         iR2pVjo/0QvW6k9aseXA2yVi15etTn30oTwveTCtbsaAMPq0W9LG1HPjKakjaHPBomCR
         lJ+pxpB5D2dZnSYSZkn3fWY0Lxl2WhxJSx/h7Mn8BTXQQrXYvRjjUyGIFDcRu7VKSIIq
         iTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dUhXuQoQxDCt98REQjfdlcmSqAovKMbEPpFNEVvZ0S8=;
        b=QWlkP8IDA0oK6iJQdLgzCYVSI+rsoJohjazz2jdSC0hv3fYmmKEJVsZZz16/wr8njd
         /JmIje2wekNeNew9vHtKXd/GpP+Xf69T5H/K22VQBt+BZJAVCvrBWy4M3QeYSqZ5LeEq
         Capgd/LslFlEu8jfIERrgaYl15qh2F1qxodNFZJcdsjpEuD/g4CiXLCx6V9DK5y1/HdW
         DoF7qYIilZ1LK8XW7E0LHTIgGQHEOMqNgkegOXKUzdKYzc4+9v45pUiSoh5gsnD5yQok
         oTU0eRWrJzV6Vn7oK1hS1jMwLi/Tf4DG4cH6CjtOyyGXowR0g6RDhROVne513H37dzMJ
         aCMg==
X-Gm-Message-State: AOAM533if4W1Rgyp0W7017n3436cyEk1XJt489M/d0G3pMmxtfgxFEZU
	ttQu1g6H4ecyXJNVMjUydhCZG7DzB2gd+liTYQw=
X-Google-Smtp-Source: ABdhPJyDa3CdFDFB+ecw/u6aTu7OfADl42R6RJASainzT2GvDIpqH6Jo42TEcMG66rgrdB7ot3sTbP/SgS3o2VxEhCk=
X-Received: by 2002:a05:6e02:ea2:: with SMTP id u2mr19613014ilj.247.1625700126957;
 Wed, 07 Jul 2021 16:22:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <64de6a11-5ff0-9931-d09b-2246cb37b284@acm.org> <20210706160857.6d4c63aa@hermes.local>
 <f391c00d-7f4f-a60c-0230-4aca5ea2d4ed@acm.org> <CAHk-=wiwZWAo_Ki587FD2BrAQVK71TBN=uKimdBf1Pxg3=+nTw@mail.gmail.com>
 <22460501-fe09-f8e7-1051-b6b692500859@acm.org> <CANiq72nKao=rz89yajChtsM8Nvv2LM-xZfX+iwk686SDMhv5iw@mail.gmail.com>
 <YOYuCXKm3g1elu0t@pendragon.ideasonboard.com>
In-Reply-To: <YOYuCXKm3g1elu0t@pendragon.ideasonboard.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jul 2021 01:21:55 +0200
Message-ID: <CANiq72=o5hKZyFqnGvd-3LeqjbR+JDsWhf=rJkimTKQSqf45pg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Stephen Hemminger <stephen@networkplumber.org>, Roland Dreier <roland@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 12:44 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> You're comparing apples and pears though. A C++ function that is meant
> to transfer unique ownership of an object to the caller should return a
> std::unique_ptr<> on a container that stores the data. We're getting

Nope, I am not comparing apples and pears. I just showed you a trivial
way to make UB in C++20 with one of the types someone else mentioned.

You mention `std::unique_ptr` now. Same deal:

    std::unique_ptr<int> f() {
        return {}; // returns a `nullptr`
    }

You will now reply: "oh, but you are *not* supposed to use it like
that!". But the point is: it is not about the simple examples, it is
about the complex cases where objects are alive for a long time,
passed across chains of calls, manipulated in several places, across
different threads, etc., etc. so that reasoning is non-local.

Don't get me wrong, `std::unique_ptr` is nice, and I have used it many
times in my career with good results. Still, it is far from what Rust
offers.

Another extremely typical example:

    std::vector<int> v;
    ...
    int * p = v.data(); // looks OK
    ...
    v.push_back(42); // looks OK
    ...
    f(p); // oh, wait...

> off-topic though, this mail thread isn't about comparing C++ and rust
> :-)

Well, if people bring up C++ as an alternative to Rust, they are
implying Rust does not offer much more than C++. Which is false,
misleading, and directly counters the Rust support proposal, thus I
feel the need to answer.

Again, don't get me wrong: while one can definitely see Rust as a
"cleaned up" C/C++ (it is, in a way); the key is that it *also* offers
major advantages using a few new research ideas that no other system
language had (even SPARK had to catch up [1]). It is not just a
sweeter syntax or a few fancy features here and there as many seem to
imply in many fora.

[1] https://blog.adacore.com/using-pointers-in-spark

Cheers,
Miguel

