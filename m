Return-Path: <ksummit+bounces-581-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EEA40C9CC
	for <lists@lfdr.de>; Wed, 15 Sep 2021 18:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 441723E105C
	for <lists@lfdr.de>; Wed, 15 Sep 2021 16:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FD53FD8;
	Wed, 15 Sep 2021 16:11:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E799C3FC5
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 16:11:04 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id t4so3967734qkb.9
        for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 09:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=n4Qnqbu11Fuo96IE/TgFwqX5rTo16bth+fQjOuHF8Qw=;
        b=f/6XS8ROr3zX3dKYXjYy/3oxaU2gHeK3GOC1Zc/TPNplUws1qV/8r8+tFzZa9AbaPs
         QSqRWhVH8Sbz7HeIZzVm2yMCxeLzQ/UrbkGCMJhzYDOVGaAQU3W0fJXnSPISEBcrAOwh
         5m3KZIU63FH9bRgeYtmO61wJHaw1tgFhsQ3Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n4Qnqbu11Fuo96IE/TgFwqX5rTo16bth+fQjOuHF8Qw=;
        b=jorE2tzzmBUPo+zbCl4bnS2lnrnjowTNKxnfefz+LCplG2eLcYlx+2epLwL6nq6Dnx
         w9kXIz0s46I79x2q5ZmWwCQF2Dx5jnSrgrHSIzI1fB0udCu0Bdg2bwbuybFRSfqnOwiC
         lCSRd5svIkxLUTrA1wS96NjRHDEK0ZXitIiiReKnZfwUK697Xh4j7OF79uIv6WafJtYF
         gf2AKYvokflgUm9xKpHDJ7+kDYWxIAryOywqL1sNLvDuaeiK+h/SWjiy30GXf9VONk4J
         33X7v4Fyjet/ad5zXdllWZxVDWLz0828w6mF5rAbNgzfYnkd3oTn8vw9BRQqciblJoVX
         Mt6Q==
X-Gm-Message-State: AOAM530AC3Qk1cW4HwXKiwqDHzjzHlF/ruz9YyPam5pbEf+gqD3wWXkH
	RFBoHxp4BwqAjfIz0BSrRXrW8SFlKOHDeg==
X-Google-Smtp-Source: ABdhPJySdABmG9XMVgnIZ2unXJDHlF1rmbvnPaUsRMFANrAP29f+XLWxajI3mJhGtvYnoD/p3KV/Zw==
X-Received: by 2002:a37:a4c5:: with SMTP id n188mr685012qke.273.1631722263890;
        Wed, 15 Sep 2021 09:11:03 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id w7sm189790qtv.93.2021.09.15.09.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 09:11:03 -0700 (PDT)
Message-ID: <1efba77b-965f-62cc-8f80-1e2b0a4f5c2a@labbott.name>
Date: Wed, 15 Sep 2021 12:11:02 -0400
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Reminder: Voting procedures for the Linux Foundation Technical
 Advisory Board
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>
References: <fccbdadc-a57a-f6fe-68d2-0fbac2fd6b81@labbott.name>
 <b90db9e7-9b6b-c415-d087-3505ba0be0d6@labbott.name>
 <YUH+DO5aHWGVdNb7@pendragon.ideasonboard.com>
 <dc45975a-86df-a70d-ff15-58a3bdcf09ee@labbott.name>
 <6db59b8a4874b60cab7069fd06d180c2601bb427.camel@sipsolutions.net>
From: Laura Abbott <laura@labbott.name>
In-Reply-To: <6db59b8a4874b60cab7069fd06d180c2601bb427.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/21 11:49, Johannes Berg wrote:
> On Wed, 2021-09-15 at 10:36 -0400, Laura Abbott wrote:
>>
>> I did make an attempt to send e-mails to the > 50 commits individuals
> 
> So if we got the "look for your ballot" email from you, that means we're
> on the list?
> 
> I agree with Laurent, it's a bit confusing now to figure out whether we
> should request or not, and if we have to request before the automated
> ones are sent out, we can't wait for that either.
> 
> I'm sure I'm on the list, but I guess others aren't quite so sure.
> 
> johannes
> 

You should only request a ballot if you think you have between
3-49 commits. I agree this is a bit confusing and this should
have been worded better and we'll make sure to do better next
year.

Thanks,
Laura

