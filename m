Return-Path: <ksummit+bounces-1226-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C985905768
	for <lists@lfdr.de>; Wed, 12 Jun 2024 17:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9698F1C2231E
	for <lists@lfdr.de>; Wed, 12 Jun 2024 15:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E5F181301;
	Wed, 12 Jun 2024 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsVSuRSf"
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AD8180A9C
	for <ksummit@lists.linux.dev>; Wed, 12 Jun 2024 15:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718207450; cv=none; b=GuNr5558mAC5OdkuH4CNsyRR1WE9AiYRF8f/bk63rtCOSkfSGC03Ev52+AWFSgjTYTwDZapwBkLhBkyJx4dP3FmI05+wpDNfr5eb2IINOEWL2vm/nHPg1ayTWl+QbdlYxwLeg32SbivbklMqnZUMt/VOfv76Gzbx7arPiFYRYaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718207450; c=relaxed/simple;
	bh=Qpk3zIMkNGc0WlmEnh8UEoXUTfe8guFnrxHEo3hs0uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDjULSdQlXFXVWlXS1aEshvXstlvINh/n0S/DwJ+n1MdQK1YfAPcREQVr9QKnQ/1IBouzCYJz2xUr0I/IiiqaLpBreXlzHbo5mDeuzE/wQWhH+QN8NaNmwIHeUV1Ulr8+GHMEvSyCK4DbdQWXzr839KQkwsJ9YncSEiAzWWOaDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsVSuRSf; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7024d571d8eso2015768b3a.0
        for <ksummit@lists.linux.dev>; Wed, 12 Jun 2024 08:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718207449; x=1718812249; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2F8aYsEwgaDqGnzdNsTnHb5SOMb96Oxaqd5nUu+5eLs=;
        b=dsVSuRSfTdpqVfnmu8W8oqrxR2o9kR6wjSJC7BNyMcBWgoemxaebF6qschMEJ05aft
         yqJnOl102FCx6qPN3e+OYP9H3Xba0Zu2rOabojG7bMtRLsWougyFATeV3WEfnv4Mc9lg
         if1bUL263ELyK2rk40/l43wCzDOMCx1TbXSZsenGtBJQ8kd1RgAkKDp45ulwuEV811ii
         p2wZrJhw9ZZSzXMZXHjVugHk9VQY7L6B6ouIPpduY1TinEBk2084L0GSvfHdTM+h9laD
         0u9mSf/MovPf74A982zqCFXQwzIrnEfyIyn09xNZMspu9XsOtWS8Odn8TyJ8r2HA0/F2
         w+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718207449; x=1718812249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2F8aYsEwgaDqGnzdNsTnHb5SOMb96Oxaqd5nUu+5eLs=;
        b=oQKRHR5OyQ+o1dGdTenNlvA8gHpur1/X9LxaNs1CvUXr3QNUyDR+Am/oWPkhBjhGLM
         br1K4ITCN5mU5G0wl3M+q55x7EQHUoR+ggnqPQntRRgxALPc1yGznkY1xDkF4evPLmTk
         j8qxwl583P6S4Mw6y45WCdMNuvsdyrds341Gqaj4EW1ZrIUDQTC3rQaawbPYvVXe3/ER
         1kbN+D8cHwGkxnVpHRwEw4YV/+l/kVlCONL47MH3rE9wDsruZpypMZSK+XEppajHEihc
         ROq1wENY7eNBPw9HGausOMG5ZTpRaD9d3zFNl18FCuSX5VR3YBy/52lnKbsRTxCikErR
         Hn5A==
X-Gm-Message-State: AOJu0Yzm+FQcxewxDZkjaWEJ7LlNolK9lGAf+eOXvVVurQ+UiLfagvnG
	WHAFBj46tzqTbvSFb+ZYaZ4EJk2twRdjVx5ae7HATPGC5BqYCK7IbMGdbw==
X-Google-Smtp-Source: AGHT+IHin7DVTecAt5dfgG/fuqRAReiG62dO9j5pWuK4bgOdXeatoP5QEP7uqbi1OA6S/+J2CJSngw==
X-Received: by 2002:a05:6a00:a14:b0:704:23dc:6473 with SMTP id d2e1a72fcca58-705bcf09b55mr3287085b3a.30.1718207448548;
        Wed, 12 Jun 2024 08:50:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705c0d75ccbsm1209590b3a.46.2024.06.12.08.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 08:50:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9b28bd22-f4b7-4bb4-8471-cb131347b6e8@roeck-us.net>
Date: Wed, 12 Jun 2024 08:50:46 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] regressions: our workflows are the biggest enemy
To: Steven Rostedt <rostedt@goodmis.org>,
 Thorsten Leemhuis <linux@leemhuis.info>
Cc: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <5182e50a-3d13-4edc-8f2a-a024e0588177@leemhuis.info>
 <20240612112622.21bf7c89@rorschach.local.home>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240612112622.21bf7c89@rorschach.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/24 08:26, Steven Rostedt wrote:
> On Wed, 12 Jun 2024 08:34:42 +0200
> Thorsten Leemhuis <linux@leemhuis.info> wrote:
> 
>> The talk among others will describe why some workflow patterns are what
>> frequently leads to regressions -- and why they are also a factor why
>> some subsystems fix regression quickly, while others take weeks or
>> months to resolve.
> 
> The above looks more than a TECH TOPIC. If you have real numbers that
> point out workflows that are an issue, I think this should be discussed
> at Maintainers Summit, and perhaps we should start "encouraging" people
> to change their workflows. Especially if we have hard data showing
> that it's not working.
> 
> /me hopes he's not one of the ones with a bad workflow!
> 

Same here...

Guenter



