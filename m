Return-Path: <ksummit+bounces-274-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id E26B43BDF9F
	for <lists@lfdr.de>; Wed,  7 Jul 2021 01:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 61EB73E0FFB
	for <lists@lfdr.de>; Tue,  6 Jul 2021 23:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E2C2FAD;
	Tue,  6 Jul 2021 23:09:02 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9568A72
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 23:09:01 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id 145so516611pfv.0
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 16:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RVWosfY3kT+9FxvS5/CQHabYt6CS6DXhIxAYiv1Xc2U=;
        b=u5J4Z2CGtnVvOPriJuQvfzh6RFQ7h6TSzjIcVvvrs6wrxI/462XnJUJai7yZURS22E
         ha4mzKsqDc6kC4NSC55N25IU35xTVt/PNUOrRhDJdpIQyRVm9bKL6QMtEflKlLH8Fc6M
         FADmEzfhhAf2jz4wA23r4MQ4K2rkxgVvqhm0mDrSw5IYoe/cKvkOOxIgJtLNyCPeOj0J
         SsskVtYDO4U4PwS/LrDTV3e70heOPaEqL93F2S4fKQ1VExhgiXD40cWxSRta0UxVxwg7
         X6gyjzZxhSudOsrzzYb+4Ip3iOeXgQHp7sdLOiJS1UZ5Gd3wHvbfnfO4vgF9KOLTj06d
         XfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RVWosfY3kT+9FxvS5/CQHabYt6CS6DXhIxAYiv1Xc2U=;
        b=oiCGhpw/JHKhuqBNcNzes1sCP0CLWcoSuZn12T22xOBIWenQT2Tnp/x6dAbvWy0erc
         qEedNFIRkAADiXVkcqmF+BYNY1W8zopNBK+vgqBl1EcrCqbM548xBxBHiotE6nI/iS/b
         9iciVAqdOqY5sBt6yXLj6MJ9clJxMuOKA1NT/ixL6WsD3yVS7oZhdalh42etfr1JBeEq
         B15soNXTU/GfLTjjNUmBtz1FszAtpyuqokoq/tHELwvqWgoa/370wwAMc0IywzBLDc7C
         5ogRrW3t4je1fShND6bl5+qWPQ47psu2f9h32z0GV0zZv+GQbDXZi8UxqEn2qtfN0x2I
         OJog==
X-Gm-Message-State: AOAM530rGVZUDtF+BEsNja/bzdCKtOsp2YQXdIM4HJQzlxYZgbCskoZr
	eTZYWv417hw5L1tus5su1NoJ3Q==
X-Google-Smtp-Source: ABdhPJwrpRzQYGH54KMpOJ/hj5PCsAoFgDM8Jcy0YAeTCPl8CKsOW5rqUKc9uP2DnNRFJ5A0joiHQg==
X-Received: by 2002:a63:e841:: with SMTP id a1mr23057295pgk.197.1625612940949;
        Tue, 06 Jul 2021 16:09:00 -0700 (PDT)
Received: from hermes.local (204-195-33-123.wavecable.com. [204.195.33.123])
        by smtp.gmail.com with ESMTPSA id e18sm13065168pfc.85.2021.07.06.16.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 16:09:00 -0700 (PDT)
Date: Tue, 6 Jul 2021 16:08:57 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Roland Dreier <roland@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <20210706160857.6d4c63aa@hermes.local>
In-Reply-To: <64de6a11-5ff0-9931-d09b-2246cb37b284@acm.org>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
	<CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
	<CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
	<64de6a11-5ff0-9931-d09b-2246cb37b284@acm.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 6 Jul 2021 14:45:50 -0700
Bart Van Assche <bvanassche@acm.org> wrote:

> On 7/6/21 1:00 PM, Roland Dreier wrote:
> > One area I see where Rust could make a big improvement for drivers is
> > in using RAII for error paths.  Drivers often have a lot of code like
> > 
> >     if (something())
> >         return err;
> > 
> >     if (something_else())
> >         goto undo_something;
> > 
> >     if (a_third_thing())
> >         goto undo_two_things;
> > 
> > and so on, which is difficult to get right in the first place and even
> > harder to keep correct in the face of changes.  
> 
> Although cumbersome, it is possible to implement RAII by using the gcc
> extensions to the C language. An example:
> 
> #include <stdio.h>
> #include <stdlib.h>
> 
> #define CONCAT2(a, b) a##b
> #define CONCAT(a, b) CONCAT2(a, b)
> #define DECL_WITH_DTOR_NAME(declaration, initializer, cleanup_func_name,\
>                             arglist, cleanup_func_body)                 \
>     void cleanup_func_name(arglist) { cleanup_func_body; }              \
>     declaration __attribute__((cleanup(cleanup_func_name))) = initializer
> #define DECL_WITH_DTOR(declaration, initializer, arglist, cleanup_func_body) \
>     DECL_WITH_DTOR_NAME(declaration, initializer,                       \
>                         CONCAT(cleanup_func, __COUNTER__), arglist,     \
>                         cleanup_func_body)
> 
> int main(int argc, char** argv)
> {
>     DECL_WITH_DTOR(void *p, NULL, void **p,
>                    printf("freeing p = %p\n", *p); free(*p););
>     DECL_WITH_DTOR(void *q, NULL, void **q,
>                    printf("freeing q = %p\n", *q); free(*q););
>     p = malloc(7);
>     q = malloc(3);
>     printf("p = %p; q = %p\n", p, q);
>     return 0;
> }
> 
> The output of the above code:
> 
> p = 0xd952a0; q = 0xd952c0
> freeing q = 0xd952c0
> freeing p = 0xd952a0
> 

Why not use the GCC cleanup function attribute, it is a lot cleaner than
having ugly error prone macros.

#define _cleanup_free __atttribute__((__cleanup__(free)))

int main(int argc, char **argv)
{
          _cleanup_free_ void *p;
          _cleanup_free_  void *q;





