Return-Path: <ksummit+bounces-307-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A013BEFF1
	for <lists@lfdr.de>; Wed,  7 Jul 2021 20:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id DA6551C0EBF
	for <lists@lfdr.de>; Wed,  7 Jul 2021 18:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1887D2F80;
	Wed,  7 Jul 2021 18:57:41 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C785B70
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 18:57:39 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id r26so6714293lfp.2
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 11:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lCGtiPGRU41wO9kc5Giz299DeK3xU/9kVwLhht0XNe8=;
        b=U54UoT4TItRu/ElK2sguw6YmH+Dumj/kkeuOk8dW54lC5elm+wB6BPJ4wM+vWFKjF6
         HnfWETRoNu5avy6UWaugewmIo53iXe+cpYUtydpqzxevVRiDTUAL4kQ8xIwxE/pPXPwY
         SIgOJq4w2sCpL/yXADhm0K+KdnwCtOPQUfSMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lCGtiPGRU41wO9kc5Giz299DeK3xU/9kVwLhht0XNe8=;
        b=GC5kZhk95bMqybYT+SHewUQ92LNmDoOy5z8V0CJsJfva4E1F+QTCtMrcr6k9zm7Vpw
         iGCbjQ2godoiZHksszrWCsYdPyts5GZ3qns2cE81ZpxNEcNCEXf5QWEI130K5wFcrNLa
         vj9qJ2Y2paVaAp/vtaXe2CGNzBhxGHqIro/HqhU+GoMMMQQs++IxwisWTI4NHSxlkpld
         lRTRVbvLvl27ie8naq2XkxdyAf+5BLQLEcD4Efcp7jRhsH3MEG8q8h0CgFg5taUqlc6n
         KCEp7MlnXobLY0bKIxb9lrUNVGlpE3ODZ2hxemBya7ZwNH4pJJ7ba/FoRNHT4/4kxMXP
         2z7A==
X-Gm-Message-State: AOAM531QNpdxTzmSn5SurKd8oWTkJxpUP9tepZBKE5onkBrx2FEjedPY
	g8GSpL+4liC6v3VQnXg+6lKGaQoIYmFOODwDCa0=
X-Google-Smtp-Source: ABdhPJxaUbYH8FxCrD15EW21td4RM0Nifoksd/r7S42RbY4wnhrxfrNYVbHC++Lk3yZUzN4wlPeS4Q==
X-Received: by 2002:a2e:988e:: with SMTP id b14mr19930022ljj.328.1625684257208;
        Wed, 07 Jul 2021 11:57:37 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id v21sm1775338ljv.124.2021.07.07.11.57.36
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 11:57:36 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id p16so6726703lfc.5
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 11:57:36 -0700 (PDT)
X-Received: by 2002:a2e:50b:: with SMTP id 11mr21008562ljf.220.1625684256043;
 Wed, 07 Jul 2021 11:57:36 -0700 (PDT)
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
 <f391c00d-7f4f-a60c-0230-4aca5ea2d4ed@acm.org>
In-Reply-To: <f391c00d-7f4f-a60c-0230-4aca5ea2d4ed@acm.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 7 Jul 2021 11:57:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiwZWAo_Ki587FD2BrAQVK71TBN=uKimdBf1Pxg3=+nTw@mail.gmail.com>
Message-ID: <CAHk-=wiwZWAo_Ki587FD2BrAQVK71TBN=uKimdBf1Pxg3=+nTw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Bart Van Assche <bvanassche@acm.org>
Cc: Stephen Hemminger <stephen@networkplumber.org>, Roland Dreier <roland@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 7:41 PM Bart Van Assche <bvanassche@acm.org> wrote:
>
> As a sidenote, I'm surprised that C++ is not supported for Linux kernel
> code since C++ supports multiple mechanisms [..]

You'd have to get rid of some of the complete garbage from C++ for it
to be usable.

One of the trivial ones is "new" - not only is it a horribly stupid
namespace violation, but it depends on exception handling that isn't
viable for the kernel, so it's a namespace violation that has no
upsides, only downsides.

Could we fix it with some kind of "-Dnew=New" trickery? Yes, but
considering all the other issues, it's just not worth the pain. C++ is
simply not a good language. It doesn't fix any of the fundamental
issues in C (ie no actual safety), and instead it introduces a lot of
new problems due to bad designs.

            Linus

