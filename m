Return-Path: <ksummit+bounces-231-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1793B48C6
	for <lists@lfdr.de>; Fri, 25 Jun 2021 20:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 1EAAB1C0E0F
	for <lists@lfdr.de>; Fri, 25 Jun 2021 18:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E806D11;
	Fri, 25 Jun 2021 18:28:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E02F2FB2
	for <ksummit@lists.linux.dev>; Fri, 25 Jun 2021 18:28:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id r3so2315424wmq.1
        for <ksummit@lists.linux.dev>; Fri, 25 Jun 2021 11:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=7uZ896GRLtwIx9KU1ax4TYsql4qljUIsXDZtBfMzuiY=;
        b=XdgHY0rV0qN134TgyteQ8O83ouV28P18JHExO+Tc1gFXOyUQ9bX91wD5EjqaeTJe0w
         wza7+zJpNBezeEALHzZJskyY/DCIk6pYWxpt06IoNUl71MfNFIw/rBGUoZe1CSGAlsHZ
         41nuFQcaEYjYzFbTzChZ4esGJ+ozD9ypZQJJDjxBEFSYhS4zAOp8ixPaBknstwMAwMi8
         AwwG5r7s+Yy14j7W8xgDQpT1zJLZBFS/tugqik1/ZKt70PShbZPlzrnWR+kIyDo5glE6
         OXpZv7qYhX/fFC/x+evfDMuSRb6p8XzY4uUIcAfjzlsMErky70JFpXBaV8unRZJYIdOt
         /OVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7uZ896GRLtwIx9KU1ax4TYsql4qljUIsXDZtBfMzuiY=;
        b=UG6XtIdrK1p7I0uzxBCmhhtbhPHok1S/geEGlAC3gpj4wsw+9bRGGryQGnUMuCNNyP
         mDoVmz7VEmzELFf6YJ7ztGysGKqUYOotfn7L0vRbOJLRXux4uICSLh4dg8MHuk/abuX9
         +XzrCaUm1APIkVhL5pPX7fCaMVYFj3fLxgj/8kdKuWcW6wSvfPqtM/JpGIY6QBlQC1OZ
         zOW1Vet6r359yd5+9mT9/IXQGSf+fwPUoVFf833AVMhdg3J5WkUvJiMTKr/eq8Xk1Vvr
         IAlkey+JMGGuxjYoZOKZE6a2fAkmvrNL5i2jI/fCxGZw1lmCFprqSMn9ZSAccTu7J/qv
         3g7Q==
X-Gm-Message-State: AOAM531cBEan29tcXGedJkyFDrGfC2JoFrROu90DH6cM1ToQCaAuw0rF
	sP4ZCEGjdtUSqlUnO1IBpdcESW2wrzo=
X-Google-Smtp-Source: ABdhPJwpJE3+7QRVXK46PiA37HaMbZtppbuADOzHKHlLSgi4Ql+t+IprYx9IhbkppaC5oqKQOKWoag==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr12252632wmj.120.1624645708755;
        Fri, 25 Jun 2021 11:28:28 -0700 (PDT)
Received: from [192.168.8.197] ([148.252.129.92])
        by smtp.gmail.com with ESMTPSA id e8sm6587023wrq.10.2021.06.25.11.28.27
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 11:28:28 -0700 (PDT)
Subject: Re: [TECH TOPIC] io_uring: BPF controlled I/O
From: Pavel Begunkov <asml.silence@gmail.com>
To: ksummit@lists.linux.dev
References: <b13d6f81-1679-dada-5bdf-1f94e0ba44c1@gmail.com>
Message-ID: <66afa1cd-aeb9-1103-87b5-ab27734871d4@gmail.com>
Date: Fri, 25 Jun 2021 19:28:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b13d6f81-1679-dada-5bdf-1f94e0ba44c1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/25/21 7:24 PM, Pavel Begunkov wrote:

Please ignore this:

My apologies, looks I screwed it and misread instructions.
Please
ignore this submission.

> io_uring is an asynchronous I/O API crafted for efficiency, where one of
> the reasons for using shared rings is to reduce context switching. It got
> lots of of features since introduction, and pushing it further we want
> to give away some of the control over submitting and controlling I/O to
> BPF, minimising the number of context switches even more.
> 
> - It should keep the number of system calls to a minimum.
> - Help to lower overhead on scheduling user processes to CPUs
>   when they have not much to do and will go to sleep briefly.
> - Be an alternative to submission queue polling for latency
>   reduction not taking as much CPU time at the same moment.
> 
> We'll go over the current design [1] and decisions, issues and plans,
> and hopefully it will engage a discussion and give impetus to curious
> minds to try it out and share ideas on how to tailor the API to fit
> their use cases.
> 
> [1] https://lore.kernel.org/io-uring/a83f147b-ea9d-e693-a2e9-c6ce16659749@gmail.com/T/#m31d0a2ac6e2213f912a200f5e8d88bd74f81406b
> 

-- 
Pavel Begunkov

