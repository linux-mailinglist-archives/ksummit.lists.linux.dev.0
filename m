Return-Path: <ksummit+bounces-318-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A904F3BF1DE
	for <lists@lfdr.de>; Thu,  8 Jul 2021 00:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 16F963E1042
	for <lists@lfdr.de>; Wed,  7 Jul 2021 22:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A345C2F80;
	Wed,  7 Jul 2021 22:11:30 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9442C168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 22:11:29 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id l18so683373iow.4
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 15:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MBV5G0gKZERUzhHQRzGmtW0/FmOQXXSCnJhcUYHbhAs=;
        b=Xu1wFmYGxEY0rwAk99XTu+gQ98wweogZEp2VWVz4Y3XVd+HmCcX1Z+QRmsEWGyaEFv
         vanc9dtGYIgz82vzYg6hr4Hkl2MzYCBtUysCZs+n/tgkSIHAxQFJldyBdBi3q8AGQnxZ
         DL7WKySYTJJ4wAaezg1lK/Wwgh0h6Z4ysMvS+4f5a5Mf7re0hoU7MDw+my4ZQfQRS51v
         ssxHbu6ROpQ0j5V8G+1v9Ro++GWMbbPMUp4Ws5NMNLDMFQ2Z96Bt2HIs3MR6n1n5fCRD
         3aVXHHkurAP3xECF9egeIWbYsp28GUAlX2JRWBrJQmaQv7Cx5kSZRnJaqGHHN6WmLLq1
         hhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MBV5G0gKZERUzhHQRzGmtW0/FmOQXXSCnJhcUYHbhAs=;
        b=T0kiEIWmuzaYa9H5RzZKk1eUuFaiVSIrwZRF+kFdEpKH4DNrEsjkxzDNxQkoiMSk1f
         IfvVLYUktj1gPRo2y2TiWljL865ibHELnA9cTUgtSmijvqPzce3+SPobJWIowianUpRH
         OCPworQUNOMj5G4Wn3sZP2NInro39VPKATH6VOmp7B8I7NTYoOg21GOBQYo7D85oLHeE
         G9f7DlZscFxGhmLj3VbqJQP9swcCX915hWg2xdETFkwiZed6NcMN2nkwAlL9Vbutnz6K
         ACJqKdJrUhNZrb071jye9MiEdWyx4J6AImDOsgmB85gyRXDIBYp6Cc0WrJSjCkx2tLbR
         F7ng==
X-Gm-Message-State: AOAM533MeOS5JGm4EJEbYX9QuYBOhES8aQnVz4kHTWyEPIS4I+4W1ZC8
	p7kIku37MD5+Hmhat8LEpoJG+8B4RUycT8cqBhs=
X-Google-Smtp-Source: ABdhPJxw1Gv/kA29ECewMiinFunmao46k3pk35eenuKneSYthZtAPyy40Fvkvr9Z+900Hi41yUs36QP68EyTuezv9VU=
X-Received: by 2002:a02:a48d:: with SMTP id d13mr14894476jam.28.1625695888818;
 Wed, 07 Jul 2021 15:11:28 -0700 (PDT)
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
 <22460501-fe09-f8e7-1051-b6b692500859@acm.org>
In-Reply-To: <22460501-fe09-f8e7-1051-b6b692500859@acm.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jul 2021 00:11:16 +0200
Message-ID: <CANiq72nKao=rz89yajChtsM8Nvv2LM-xZfX+iwk686SDMhv5iw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Bart Van Assche <bvanassche@acm.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Stephen Hemminger <stephen@networkplumber.org>, Roland Dreier <roland@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 10:32 PM Bart Van Assche <bvanassche@acm.org> wrote:
>
> Thank you for having shared your opinion. You may want to know that
> every C++ project I have worked on so far enabled at least the following
> compiler flags: -fno-exceptions and -fno-rtti.
>
> What the C++ operator new does if not enough memory is available depends
> on the implementation of that operator. We could e.g. modify the
> behavior of operator new as follows:
> - Add -fno-builtin-new to the compiler flags.
> - Define a custom version of operator new.

The issue is that, even if people liked C++ a lot, there is little
point in using C++ once Rust is an option.

Even if you discuss "modern C++" (i.e. post-C++11, and even
post-C++17), there is really no comparison.

For instance, you mentioned `std::span` from the very latest C++20
standard; let's build one:

    std::span<int> f() {
        int a[] = { foo() };
        std::span<int> s(a);
        return s;
    }

Now anybody that accesses the returned `std::span` has just introduced
UB. From a quick test, neither Clang nor GCC warn about it. Even if
they end up detecting such a simple case, it is impossible to do so in
the general case.

Yes, it is a stupid mistake, we should not do that, and the usual
arguments. But the point is UB is still as easy as has always been to
introduce in both C and C++. In Rust, that mistake does not happen.

Cheers,
Miguel

