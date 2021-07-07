Return-Path: <ksummit+bounces-309-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EB83BF0C6
	for <lists@lfdr.de>; Wed,  7 Jul 2021 22:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 0EF631C0DC8
	for <lists@lfdr.de>; Wed,  7 Jul 2021 20:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05CA2F80;
	Wed,  7 Jul 2021 20:32:41 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC392168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 20:32:40 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id i13so1721424plb.10
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 13:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4MkTE9OXWGuKJ84ETtP0raqn82PJQUW56FSyszJ7ucY=;
        b=EZjqMFRl5lGD3y5vP01J6REbtqOBG5HasASa1STrkVAh4lxRn5FGRNPIsAi3g3Q9hZ
         Ea39RHZKzvgCHh65SJlKqqk7YUVXqui/S6aJsmHjPB2yF/X1gnjxWw/Uze0r1K83ceC2
         knVP+2qQJ/KN1vK4kRknsyNhopXjvi3NgomvdvcIdnfgWPzVQQQurtK5iaz5cJ4MvTCE
         3B/Ln+CvLPYuraDLmkZP3V7zM0r/SgOrzUInsFNcDyuv5U8EIvYVlIfd7O6h36I1eqhk
         ORl1oRVFT0dafwdXnt6XgOW8eRTVWSl0lc8doyDxHLX8hQCxlooRdREMCG3F0zFngCOQ
         tQJw==
X-Gm-Message-State: AOAM531Swc0GhmEOBn/RpBf2OMBvid1NB2DT2qCKg0OGTGfZ41/DKBj1
	NMnYWAYvBQGjUFaeggpAQhqIiAQXtBQ=
X-Google-Smtp-Source: ABdhPJzZ931l+OUSZqVorjG8r4tNh7j9ZP6oXEEP4UtPOZImrRajLUeY+p3tsihkWdPWIsQGx8GRyg==
X-Received: by 2002:a17:902:c404:b029:129:339e:741a with SMTP id k4-20020a170902c404b0290129339e741amr22714973plk.24.1625689959356;
        Wed, 07 Jul 2021 13:32:39 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:6679:27d9:f7a8:3b7e? ([2601:647:4000:d7:6679:27d9:f7a8:3b7e])
        by smtp.gmail.com with ESMTPSA id t2sm68205pfg.73.2021.07.07.13.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 13:32:38 -0700 (PDT)
Subject: Re: [TECH TOPIC] Rust for Linux
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Hemminger <stephen@networkplumber.org>,
 Roland Dreier <roland@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <64de6a11-5ff0-9931-d09b-2246cb37b284@acm.org>
 <20210706160857.6d4c63aa@hermes.local>
 <f391c00d-7f4f-a60c-0230-4aca5ea2d4ed@acm.org>
 <CAHk-=wiwZWAo_Ki587FD2BrAQVK71TBN=uKimdBf1Pxg3=+nTw@mail.gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <22460501-fe09-f8e7-1051-b6b692500859@acm.org>
Date: Wed, 7 Jul 2021 13:32:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wiwZWAo_Ki587FD2BrAQVK71TBN=uKimdBf1Pxg3=+nTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/7/21 11:57 AM, Linus Torvalds wrote:
> On Tue, Jul 6, 2021 at 7:41 PM Bart Van Assche <bvanassche@acm.org> wrote:
>> As a sidenote, I'm surprised that C++ is not supported for Linux kernel
>> code since C++ supports multiple mechanisms [..]
> 
> You'd have to get rid of some of the complete garbage from C++ for it
> to be usable.
> 
> One of the trivial ones is "new" - not only is it a horribly stupid
> namespace violation, but it depends on exception handling that isn't
> viable for the kernel, so it's a namespace violation that has no
> upsides, only downsides.
> 
> Could we fix it with some kind of "-Dnew=New" trickery? Yes, but
> considering all the other issues, it's just not worth the pain. C++ is
> simply not a good language. It doesn't fix any of the fundamental
> issues in C (ie no actual safety), and instead it introduces a lot of
> new problems due to bad designs.

Hi Linus,

Thank you for having shared your opinion. You may want to know that
every C++ project I have worked on so far enabled at least the following
compiler flags: -fno-exceptions and -fno-rtti.

What the C++ operator new does if not enough memory is available depends
on the implementation of that operator. We could e.g. modify the
behavior of operator new as follows:
- Add -fno-builtin-new to the compiler flags.
- Define a custom version of operator new.

An example (user space code):

include <stdlib.h>
#include <stdio.h>

void *operator new(size_t size)
{
  printf("%s\n", __func__);
  return malloc(size);
}

void operator delete(void *p)
{
  printf("%s\n", __func__);
  free(p);
}

void operator delete(void *p, size_t size)
{
  printf("%s\n", __func__);
  free(p);
}

void *operator new[](size_t size)
{
  printf("%s\n", __func__);
  return malloc(size);
}

void operator delete[](void *p)
{
  printf("%s\n", __func__);
  free(p);
}

void operator delete[](void *p, size_t size)
{
  printf("%s\n", __func__);
  free(p);
}

int main(int, char **)
{
  int *intp = new int;
  long *arrayp = new long[37];
  delete[] arrayp;
  delete intp;
  return 0;
}

The output of the above code:

operator new
operator new []
operator delete []
operator delete

Bart.

