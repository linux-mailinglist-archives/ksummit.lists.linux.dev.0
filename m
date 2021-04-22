Return-Path: <ksummit+bounces-110-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D5E368500
	for <lists@lfdr.de>; Thu, 22 Apr 2021 18:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 9D1011C6643
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131F92FA0;
	Thu, 22 Apr 2021 16:38:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB2D71
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 16:38:35 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id q10so33214250pgj.2
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 09:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4cT1AM8Nym9STsHjaZOJddl35KTcQItBd5s4FDBfqDc=;
        b=tQZfqotODqj5nGTkxNkG+iRNSAOqf9erTMkEnDmR8bq1KT1ZdEeLxs75oKp/pmRUXP
         pUAc8+1rkoHXYn/PCEYIldrulpxLMQnV7x/OTJhuQAaKOEkSFsdebkEk3pzlGKJGXAVe
         DZOJ7Ir4oOfYyc9Z1Ydz265/ofS4HCcolQK9qdU6k+NRT2pTGaR1ju+VqrpQN7/7BEVh
         GFnpizv9ilqwIPfuyMTp/Akr2V7Zh1uqSKg3TThJoCmkdwaanbvnZnOm8gyu0hQ2+AkQ
         7zrgohzc84Z+sywfr9jAesCV0CanLIpj02fM0ytkeRlF10iIOShbWpOxR9fhSuDlTa3P
         lP4Q==
X-Gm-Message-State: AOAM531436tukPiHfN3yd5rV8QSh1OTS5ic0csxHQGvFFGqL+JKzhUu/
	ZrMkP9skSW3jQKTRxwnFbOuyd6ukVv4=
X-Google-Smtp-Source: ABdhPJyttJ/QxI+VlJiU1HJu2D2/3+Q4aSjT2ToOA8iI3GcCNb9Cu6Jzs1r7vGKlGbCcmu/ixBhtFw==
X-Received: by 2002:a63:175c:: with SMTP id 28mr4326538pgx.376.1619109514662;
        Thu, 22 Apr 2021 09:38:34 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:ca3e:c761:2ef0:61cd? ([2601:647:4000:d7:ca3e:c761:2ef0:61cd])
        by smtp.gmail.com with ESMTPSA id 25sm2938995pgx.72.2021.04.22.09.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 09:38:33 -0700 (PDT)
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: ksummit@lists.linux.dev
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan>
 <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
 <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <f3c4cb63-f0f7-97be-227a-7a1a0db34650@acm.org>
Date: Thu, 22 Apr 2021 09:38:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/22/21 8:42 AM, James Bottomley wrote:
>    3. Better handling of "trivial" changes, say via a resurrected trivial
>       tree

Why was the trivial tree introduced? I may be missing some history here.

I'm not convinced that sending trivial patches to a separate mailing
list and maintainer helps everyone. As an example, I want to see block
layer patches being posted on the block layer mailing list and I want to
see SCSI patches being posted on the SCSI mailing list. I don't want to
have to follow a separate "trivial" mailing list to verify whether or
not e.g. a patch is posted on that mailing list that changes a correct
comment into an incorrect comment.

Thanks,

Bart.

