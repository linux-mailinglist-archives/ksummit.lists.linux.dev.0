Return-Path: <ksummit+bounces-617-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C4B411989
	for <lists@lfdr.de>; Mon, 20 Sep 2021 18:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id DC7661C0D52
	for <lists@lfdr.de>; Mon, 20 Sep 2021 16:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8BB3FCA;
	Mon, 20 Sep 2021 16:16:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B6D72
	for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 16:16:02 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id r21so16043262qtw.11
        for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 09:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=c4p5LbkR5a+CTH/BlqAWrzithBt0LPedNw7Pvp2S/4w=;
        b=NJbdoEpOILdc7PCD5CLz6Lo0UQA5nD5bIJI8Kwpcn2NXMcMV21OnOCD6dFnj7ol8aJ
         XvCHZTKOSAybnC9k5E9JDjtzL9AL4q46OowfAfC4QyMXxGi/f4izwZRr1j0lWy2JYQZQ
         YJVYsSGmynqwobOkBDlD8ElZzP3hssAQwEcJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c4p5LbkR5a+CTH/BlqAWrzithBt0LPedNw7Pvp2S/4w=;
        b=H+aDlhiFzJ1Mr2zB1KckvGYyJrTLz1naNv7Aji9nH6FljgT0KRM0vR7xxc2T/1DT7G
         QyZpc0d7gHj5hAOpCv2lhTGOFzoGNoElxRcXy5VRfghzmcM9ZEhNuFEwqAAbbUoBGboH
         OQTf2Qpmr+g6/XMskj8u/GcTkbXNBTxZUL+tLSOhNPDkvj4Y5mv9bGk8x/L5XZRMz+ux
         LL4Fq0KEUKnPQQJMbEAtKgzAAq5M8LOUTaAUwQpNxmR0TL5nOi93MzmsvBE+uoXSsQho
         IJ1+HrHAD73zL58ZJDuocxsxfIok3wUuHPhsLz0+bz+BIPySNbaSlM8gLI7/FP+Jlh4/
         S6wA==
X-Gm-Message-State: AOAM5332V4R7OHcLYrXspUKqZaQBP4DM+RmDjfIlaibZWGqnEs43DS/N
	nE/DHpfD0RiBgAp7hhK/fTq433x/7UW0QQVY
X-Google-Smtp-Source: ABdhPJzoTZVfJXvYP1AsCVp0osILJalwXxTdsOXGGyurRIZoG4UO9I5BbvuRVkJc6V8lXcMQk7vQ5A==
X-Received: by 2002:a05:622a:1451:: with SMTP id v17mr23386098qtx.83.1632154560414;
        Mon, 20 Sep 2021 09:16:00 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id l7sm4687975qtr.87.2021.09.20.09.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 09:16:00 -0700 (PDT)
Message-ID: <2917e393-0777-81c2-6a2d-5130c37cda06@labbott.name>
Date: Mon, 20 Sep 2021 12:15:59 -0400
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [Tab-elections] IMPORTANT: CIVS opt-in for Technical Advisory
 Board voting
Content-Language: en-US
To: Dave Hansen <dave@sr71.net>, ksummit@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>
Cc: "tab-elections@lists.linuxfoundation.org"
 <tab-elections@lists.linuxfoundation.org>
References: <44ee2bfe-e4bc-b918-b908-7352ea012524@oxidecomputer.com>
 <dfa20866-0d00-9bd3-6078-5544cfa5b633@sr71.net>
From: Laura Abbott <laura@labbott.name>
In-Reply-To: <dfa20866-0d00-9bd3-6078-5544cfa5b633@sr71.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/21 11:30, Dave Hansen wrote:
> My @linux.intel.com account is the most common one from the git logs.  I
> have only received one TAB-related email there:
> 
> 	Subject: Upcoming Technical Advisory Board election -- look for
> 		 your ballot
> 
> However, I never actually received a ballot at that email, presumably
> because of this CIVS opt-in issue.
> 
> Was this just me?  Or would it be appropriate to send these opt-in
> instructions to all of those that should have received a ballot instead
> of just sending to the mailing lists?

I did make an attempt to send a message to everyone on the voting list
(which should include your @linux.intel.com mail) in addition to posting
on the list. It's possible either my message ended up in spam or it
got throttled by gmail.

Thanks,
Laura

