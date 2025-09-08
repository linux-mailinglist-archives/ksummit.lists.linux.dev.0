Return-Path: <ksummit+bounces-2305-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D350B49D73
	for <lists@lfdr.de>; Tue,  9 Sep 2025 01:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B38904E4360
	for <lists@lfdr.de>; Mon,  8 Sep 2025 23:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CFE2F744C;
	Mon,  8 Sep 2025 23:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dQZG+jzM"
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DD81B87F2
	for <ksummit@lists.linux.dev>; Mon,  8 Sep 2025 23:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757373780; cv=none; b=nU6nGCFtzwji7WGJ4tqUue/JYWEAoXo3NPNs8orRO54CCkIMCkTpNtJzg/z37PrSogOqPZo28EI6Y0cTAqdv6rCFBNP1XZSYuq2vrOh/vPHsuY/F+FqQ4J02eIytuCiwumWUgqu2Bz8qWJXLtvflQHasDdf0flltZPtXuTQhoK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757373780; c=relaxed/simple;
	bh=wzC+XpNBJQwF1bEwhy8EVkH5sNN9qAvkjdYS6cqKOYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ge7CTIzMV4w+8MHpPkCLpSTc+JmuUmqBYe0LK3lzdwcnuFkG3SEXiLw+xjMkq0L4h+tDamCLoTP1IxTqECDYNBrkLhKVCe3x+blJ6eURwkLHctUJvYN+56r8T8436T9vPNLme19Xb5MzfPDsmflJkl1HCV/L26EiS2nunK3WwZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dQZG+jzM; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=dbikA5MWBWZFlDapXs9v/8RnEa8AsViRokLPXsTB9R0=; b=dQZG+jzM35HSpM1TVuPwhmi4qi
	s4WV9wa73N61oIKe5IoTsNeAySiIHj/9rIAl94cFCfgR7NAyQOn/KTq5fvUk5xyO31oQG1+7t5QRw
	BQIJYvbJNVCUrQn8FBuYBzJ4BgC6ydaX2g/4KS/7gNZ0D07MEx0PYbztsa96+0gahlpUvkJRbaMcW
	gJ2heCFfueFiJuqpSbW3ZUXsHUgV3sQ7YV/C+hMBvMmIkc905qKCvFKEkYsAmLEb20ziDA6Dd2qsE
	SHZAQlju2WvRokjGAx2Zr8K30jg+XN+I4Kyew2HfBSsIwS7jEqxvYJwo3Y/AbbO7w6Liy5OPmDOKX
	eP9Mc5Sw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlCK-00000002vyE-3rEm;
	Mon, 08 Sep 2025 23:22:56 +0000
Message-ID: <4f2d4025-9fbf-441d-a51a-0c0d4ba16314@infradead.org>
Date: Mon, 8 Sep 2025 16:22:56 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] re-think of richACLs in AI/LLM era
To: Coly Li <colyli@fnnas.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: Jan Kara <jack@suse.cz>, ksummit@lists.linux.dev
References: <DC0B4305-C340-42C2-84B5-8C370794EBC2@fnnas.com>
 <ntzpuxiyoqf5a5ldeq4tlc37uy3nw3kojoes5ookdmcrb53ome@xbjcgntijlfl>
 <20250908113934.1a31423a@gandalf.local.home>
 <E5FD7630-3474-4F02-A4F8-A1C11DA7672A@fnnas.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <E5FD7630-3474-4F02-A4F8-A1C11DA7672A@fnnas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9/8/25 8:42 AM, Coly Li wrote:
>> 2025年9月8日 23:39，Steven Rostedt <rostedt@goodmis.org> 写道：
>>

>>>
>>> I'm not really on program committee for either a Maintainers summit or LPC
>>> so take this just as a friendly advice from a bystander :)
>>>
>>
>> As Jan has stated, this is a technical topic. But you can send it to this
>> list too. From Ted's original email:
>>
>>    Related to the Maintainer's Summit, the Kernel Summit is organized as
>>    a track which is run in parallel with the other tracks at the Linux
>>    Plumbers Conference (LPC), and is open to all registered attendees of
>>    LPC.  The goal of the Kernel Summit track will be to provide a forum
>>    to discuss specific technical issues that would be easier to resolve
>>    in person than over e-mail.  The program committee will also consider
>>    "information sharing" topics if they are clearly of interest to the
>>    wider development community (i.e., advanced training in topics that
>>    would be useful to kernel developers).
>>
>>    To suggest a topic for the Kernel Summit, please do two things. by
>>    September 10th, 2025. First, please send e-mail with a subject prefix of
>>    [TECH TOPIC] to ksummit@lists.linux.dev.  As before, please use a separate
>>    e-mail for each topic.
>>
>>    Secondly, please create a topic at the Linux Plumbers Conference
>>    proposal submission site and target it to the Kernel Summit track:
>>
>>        https://lpc.events/event/19/abstracts
>>
>>    Please do both steps.  I'll try to notice if someone forgets one or
>>    the other, but your chances of making sure your proposal gets the
>>    necessary attention and consideration are maximized by submitting both
>>    to the mailing list and the web site.
>>
>>
>> The CfP is closing this Wednesday, so please submit it soon.
> 
> Yes, I already submitted the CfP on https://lpc.events/event/19/abstracts and got the confirmation email.
> 
> Also I resend another proposal email subjected with  [TECH TOPIC]  and almost identical message body.
> 
> Thanks for the hint!

Hi,
I don't object to such a topic, but I thought that LSMs were the wave
of the future for extended attributes or special capability handling.  ?

-- 
~Randy


