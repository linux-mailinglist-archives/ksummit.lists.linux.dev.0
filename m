Return-Path: <ksummit+bounces-332-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B7F3BF635
	for <lists@lfdr.de>; Thu,  8 Jul 2021 09:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 740B71C0E38
	for <lists@lfdr.de>; Thu,  8 Jul 2021 07:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913C92F80;
	Thu,  8 Jul 2021 07:23:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44274168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 07:23:12 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id f7so1592397vsa.9
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 00:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+DJW53u8JjFUmI0YgznXVraVyJJjGLQd9/06e4q02K0=;
        b=luXp/0yFHtIupQ9TsPEKLZdxWWRky7P5o/6pJ4QhrakdQCBvXQGOyJXmXkfsYRX8v0
         GN66m39AmsT5xIeL086PyCcYozK2hBH4CF0tz0xpd3f7qzSXrFmC5Lyqqy2XG8m36Vf7
         pCYQixFP9BRPxtNK/OqQA88elePFzvQS/kmK0/r8X2oLssg8CPqqcxiRnOnyK5DvodAR
         +z7KnkalifYv8d+MvbFziawElkq15noFNWdssCQcgA0INprWnzIg5MHLocCzm5/rbGNV
         3cl336NreTMyGjI+sOMeKhwTLaD51IHlvoKZCq8ei2ZeqeNJB2/+rLJqH9i8dxMxYuZ0
         1R8w==
X-Gm-Message-State: AOAM531jlJD8k7PbZPf5MvHSBVVpK4J0DKnP0pezVMjVUmvLx7TRu9Ez
	jA31F1tWyvUrTEjA/AhMVu7iAnGOqVNExyYX16k=
X-Google-Smtp-Source: ABdhPJy4GD9GcWU3MeKK1+74zGPKbWnlsRA9mD8OjuqezW3sMkRus6lCNP+PnXLMtMrPVDDgeCz9kcEf1vEmGQD5jms=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr25809049vsd.42.1625728991364;
 Thu, 08 Jul 2021 00:23:11 -0700 (PDT)
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
 <22460501-fe09-f8e7-1051-b6b692500859@acm.org> <CAHk-=wjYGDtLafGB6wabjZCyPUiTJSda0c8h5+_8BeFNdCdrNg@mail.gmail.com>
In-Reply-To: <CAHk-=wjYGDtLafGB6wabjZCyPUiTJSda0c8h5+_8BeFNdCdrNg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jul 2021 09:22:59 +0200
Message-ID: <CAMuHMdXZBXQeV=j+06GO5wS8a6vootW6OhJtyx+MbTPJ0Nn6qA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bart Van Assche <bvanassche@acm.org>, Stephen Hemminger <stephen@networkplumber.org>, 
	Roland Dreier <roland@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Wed, Jul 7, 2021 at 10:39 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> At the same time, C++ offer no real new type or runtime safety, and
> makes the problem space just bigger. It forces you to use _more_
> casts, which then just make for more problems when it turns out the
> casts were incorrect and hid the real problem.

At least the C++ casts are easier to search for.  The C cast syntax
is very grep-unfriendly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

