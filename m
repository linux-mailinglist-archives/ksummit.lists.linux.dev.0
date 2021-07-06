Return-Path: <ksummit+bounces-271-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 108863BDF1D
	for <lists@lfdr.de>; Tue,  6 Jul 2021 23:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id A37CB3E0FE9
	for <lists@lfdr.de>; Tue,  6 Jul 2021 21:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615892FAD;
	Tue,  6 Jul 2021 21:45:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D418168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 21:45:53 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id b5-20020a17090a9905b029016fc06f6c5bso295455pjp.5
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 14:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5PHgPILxwuF6jnNtZbwU95n6sDSD7LCRNjIvV+FleDc=;
        b=T9r+GxkMb04iKzLs2Ue1mt2i9MxDxa8sTudflYqEKNPJ2gytYKfX/W+627hGgd3Fd6
         Xxynl/cCrWREo6tQ59eYm8SHA4xA0IKNuNfL47jiSNrLbIDfCHe+Afp1XV7Blue3M2Bz
         w9wlj51wgIY7oU0uxO/GMaW+jpG9FxANrfX0so63caJq86C/eT7QiEqe7ZQIqI+2KlJC
         hSWcTXa4fyuid35vOEuGGjAJAZikoHp12DjsfUx6qkSX2kBOtpU1TCbiqjaxjeR05sOv
         CbPLWIqoown5CJPByeWYLVzPsNRsgScu5QXp1lQcGsuXZmX+M0oNTf4cyaT8/hxfYz0/
         xVJQ==
X-Gm-Message-State: AOAM530Jp41OlTPPlG1kL+/8UZ1u8HjRAXdRMxRmdYV0+IEOQasTx+j8
	Ob5q+cUfcDYayLCfksDt+C/oh/nizZQ=
X-Google-Smtp-Source: ABdhPJzWe7G0aqp41F0inHIP0UY6/ughSLjCrz+TDdZDLjHMQXnRvcNkTphGSD4/M/rZ0+yZiQFHQw==
X-Received: by 2002:a17:902:c246:b029:129:b2e0:be90 with SMTP id 6-20020a170902c246b0290129b2e0be90mr3376081plg.84.1625607952503;
        Tue, 06 Jul 2021 14:45:52 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:252a:d844:346c:9921? ([2601:647:4000:d7:252a:d844:346c:9921])
        by smtp.gmail.com with ESMTPSA id c12sm16927707pfl.27.2021.07.06.14.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 14:45:51 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Roland Dreier <roland@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
Message-ID: <64de6a11-5ff0-9931-d09b-2246cb37b284@acm.org>
Date: Tue, 6 Jul 2021 14:45:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/6/21 1:00 PM, Roland Dreier wrote:
> One area I see where Rust could make a big improvement for drivers is
> in using RAII for error paths.  Drivers often have a lot of code like
> 
>     if (something())
>         return err;
> 
>     if (something_else())
>         goto undo_something;
> 
>     if (a_third_thing())
>         goto undo_two_things;
> 
> and so on, which is difficult to get right in the first place and even
> harder to keep correct in the face of changes.

Although cumbersome, it is possible to implement RAII by using the gcc
extensions to the C language. An example:

#include <stdio.h>
#include <stdlib.h>

#define CONCAT2(a, b) a##b
#define CONCAT(a, b) CONCAT2(a, b)
#define DECL_WITH_DTOR_NAME(declaration, initializer, cleanup_func_name,\
                            arglist, cleanup_func_body)                 \
    void cleanup_func_name(arglist) { cleanup_func_body; }              \
    declaration __attribute__((cleanup(cleanup_func_name))) = initializer
#define DECL_WITH_DTOR(declaration, initializer, arglist, cleanup_func_body) \
    DECL_WITH_DTOR_NAME(declaration, initializer,                       \
                        CONCAT(cleanup_func, __COUNTER__), arglist,     \
                        cleanup_func_body)

int main(int argc, char** argv)
{
    DECL_WITH_DTOR(void *p, NULL, void **p,
                   printf("freeing p = %p\n", *p); free(*p););
    DECL_WITH_DTOR(void *q, NULL, void **q,
                   printf("freeing q = %p\n", *q); free(*q););
    p = malloc(7);
    q = malloc(3);
    printf("p = %p; q = %p\n", p, q);
    return 0;
}

The output of the above code:

p = 0xd952a0; q = 0xd952c0
freeing q = 0xd952c0
freeing p = 0xd952a0

Bart.

