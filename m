Return-Path: <ksummit+bounces-259-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 372113BDDB8
	for <lists@lfdr.de>; Tue,  6 Jul 2021 21:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 8C9463E10D8
	for <lists@lfdr.de>; Tue,  6 Jul 2021 19:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C112F80;
	Tue,  6 Jul 2021 19:05:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A6A70
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 19:05:23 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id a14so12374417pls.4
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 12:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=agKnJRp3j2//uGdciBoGwAEjh7PxOGGEAhDCLgK9Vr0=;
        b=mlEIsMvHwZW7vdudIktMmdbeT4gnBNSmHMttmLBuWrDm4UhUvUDWdE6W23Bd26VHSq
         CmcWQkuNxpBJLpml6Gva9XryywUdaKrtJeBlveL1hogvNBH2/7VivZUDgOpN0DI11Xy4
         karecSDHWkZXjGLnEtwieHp8ruROYpV3ZJ0ZLN5KhEG5mdKROd0DhLuLjdXJTOoYawzJ
         pcf6U1mFYERimMh1lpaH3LnlSGp1fPuu/xElYtHCsn60IlU1mX0cWQf0jsN02/rMidG/
         lEN2p19BmyBxb/3uKHUhZKrW8jTcRIjz4jqzrT4KLTmyUexcP+W1IhOOp2dEP11yOKfd
         sQnw==
X-Gm-Message-State: AOAM531kRJQjtR8640ScrIlfXfWRfNUUnRXv5EheDT+gHcbbmuPUsmwL
	4UcOITAidcGexQDZusznVXU4R4QzRao=
X-Google-Smtp-Source: ABdhPJyPIVEM32P7fGjqdEfPZC2myc7TjjZYGVMxbuClF/3L4E5dN609i6xp79QRL8lmwW/6VUbpGw==
X-Received: by 2002:a17:90a:4586:: with SMTP id v6mr21861433pjg.36.1625598322853;
        Tue, 06 Jul 2021 12:05:22 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:252a:d844:346c:9921? ([2601:647:4000:d7:252a:d844:346c:9921])
        by smtp.gmail.com with ESMTPSA id t9sm3555811pjs.50.2021.07.06.12.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 12:05:22 -0700 (PDT)
Subject: Re: [TECH TOPIC] Rust for Linux
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <a23da43b-5ade-ef87-dd7a-392ed16ee7ec@acm.org>
Date: Tue, 6 Jul 2021 12:05:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/25/21 3:09 PM, Miguel Ojeda wrote:
> The Rust for Linux project is adding support for the Rust language to
> the Linux kernel. This talk describes the work done so far and also
> serves as an introduction for other kernel developers interested in
> using Rust in the kernel.
> 
> It covers:
> 
> - A quick introduction of the Rust language within the context of the kernel.
> - How Rust support works in the kernel: overall infrastructure,
> compilation model, the standard library (`core` and `alloc`), etc.
> - How Documentation for Rust code looks like.
> - Testing Rust code (unit tests and self tests).
> - Overview of tooling (e.g. compiler as a library, custom linters, Miri, etc.).
> - Explanation of coding guidelines (e.g. automatic formatting) and
> policies we follow (e.g. the `SAFETY` comments).
> - How kernel driver code looks like in Rust.

Will the introduction of Rust drivers require that every maintainer of
every subsystem used by Rust drivers maintains two versions of each
header file that is used by Rust drivers - one version of each header
file in C and another version of the same header file in Rust?

Thanks,

Bart.

