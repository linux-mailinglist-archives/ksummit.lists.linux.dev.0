Return-Path: <ksummit+bounces-24-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D0367517
	for <lists@lfdr.de>; Thu, 22 Apr 2021 00:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id AD8531C25A7
	for <lists@lfdr.de>; Wed, 21 Apr 2021 22:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BAA2FA1;
	Wed, 21 Apr 2021 22:18:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46622F81
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 22:18:17 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id g125so14927311iof.3
        for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 15:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kAiH/zP8FZBsQOuUOTAmlQd24oVhapZRCPBebyNhnTw=;
        b=RuVi+urStUgNK4/F8z1LMtJItZ1BChDYcl7OFBDtPTr6SOmDMr09+fgyUOxqxDklpL
         oqwpOWI3CheS03tg5OUrQnvuqYVoA9xHkaiikbdbELRZZWn9KNhFTA+WZ/HuiuHwbz9B
         ZjNjLeiLFghOvUnmArg3JsrSUAMzWbokLTORo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kAiH/zP8FZBsQOuUOTAmlQd24oVhapZRCPBebyNhnTw=;
        b=FDxbYR+hRLKvgNgrjUMi5QY9tVh9Xb244jhFjhsGFF1ffYxrDBpNCwu4Ol+L2vx5eM
         s7A3CuoF6mAKO2NAT3uhiyvs+vP2hIgtohWmUEXWDHtx26VT2SX8QllZsUkGgCN9vagB
         58B8QeLpwYrjkUdEPo6t3lMQJuUt6Q1J5+StZN5i4Zt1zYUFUljQBl0f6C7DHDwW4sFg
         39BKkef6aj4ofu6LnobGneqXZ1ZAlgtWWhN8uuThdunCjZ+RX8DIppsUiq6obd+p+ly5
         PrQ2tYvzWKi3qhGx5f7qH6ujrQKlgdjSzdeIFwLZcCwwFh+BvXXbVfHCXMYWpe5DVSx/
         NPdw==
X-Gm-Message-State: AOAM530zHV8psppP+s8rEGH9vW9I9r10NMUUeD2ec43KQ8zo0cWX27Sn
	pHF8/mdsex2s6GupLSqaPvY8RQ==
X-Google-Smtp-Source: ABdhPJz5EaqO+wCw2F6CvIDixs9cyjDEf8sWg544DstBDQjR2x96x//XILSrXWM/yHqDb24sTbuZlQ==
X-Received: by 2002:a05:6638:218b:: with SMTP id s11mr426838jaj.81.1619043496770;
        Wed, 21 Apr 2021 15:18:16 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id n1sm341007ion.22.2021.04.21.15.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 15:18:16 -0700 (PDT)
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Jiri Kosina <jkosina@suse.cz>,
 James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: ksummit@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <nycvar.YFH.7.76.2104212125330.18270@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2104212226420.18270@cbobk.fhfr.pm>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a49275f4-ebb9-8a12-1911-cf3114cb35c2@linuxfoundation.org>
Date: Wed, 21 Apr 2021 16:18:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2104212226420.18270@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/21/21 2:28 PM, Jiri Kosina wrote:
> On Wed, 21 Apr 2021, Jiri Kosina wrote:
> 
>> I am all for discussing policy of trivial patches (*), but just to make it
>> clear -- I don't think that's really directly related to the University of
>> Minnesota issue.
> 
> (*) saying that as a de-facto maintainer of trivial.git, although that
>      tree has been severely neglected over the past years. Also, as far as
>      I can say, none of the umn.edu patches went in through the trivial
>      tree
> 

I agree. I looked at a few including this one:

8e949363f017e2011464812a714fb29710fb95b4
net: mlx5: Add a missing check on idr_find, free buf

Definitely doesn't fall under trivial category. It is unfortunate
that we are in the situation to not be able to trust patches as we
do get fix patches for syzbot bugs from new developers.

There are no easy solutions other than reviews. Trivial patch focused
policy will not help address this problem.

thanks,
-- Shuah

