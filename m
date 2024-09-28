Return-Path: <ksummit+bounces-1579-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB7989104
	for <lists@lfdr.de>; Sat, 28 Sep 2024 20:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02B4A1F21599
	for <lists@lfdr.de>; Sat, 28 Sep 2024 18:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9871714D718;
	Sat, 28 Sep 2024 18:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OWSEWhep"
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0602AEEE
	for <ksummit@lists.linux.dev>; Sat, 28 Sep 2024 18:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727547347; cv=none; b=sbGuZ1J7Bt8fHQ2Hevg+NZmtLo32CrHSoS8kyvbRRelhFsht+DUKXnmXRp+hy/q3GXtWDCLn51UACZbqZVhSsxttpeNAjMp3hZ6Qm73zP5vh+BltxtJZ1nQSoKMtYihkQ05t8QULeWv2/U/AYyvt7ZpYVaqmLfQ6r9qRv3eQ+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727547347; c=relaxed/simple;
	bh=yu6wRhjAqvi+iC2JQrjxwNhErqRWaArcKcmt8N2J6vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUPOQVqQpGXjGCWTZ73II9f/fOz/lkGqVfMz22Jaq/l6NP4aSP2bc2rEceOG17HXM90C3LYlTdROlH83nNeTk1mTXAYTzopAu/2nwGGOLYC9q6hvKmgesBXDG/fhGOkZVvVf5VOi2SvWJ1tSVmpciutHTzVyK3J0uWg9SHbMRdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OWSEWhep; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a3525ba6aaso145275ab.2
        for <ksummit@lists.linux.dev>; Sat, 28 Sep 2024 11:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727547345; x=1728152145; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdzkUQpgo/og7cjoar69c4IL7JL/UbM7NZAGHUR31B4=;
        b=OWSEWhepRz06WRFfTLAaQvVyz/8lUu+mK2twXv+mUDyQD6mKApPFRjCIA0S7nHvm/z
         uM8hr48kYHGr6epusHG+zhHhUoFt1g7RV/WYmMjJkmvXXy54z3GxHpOslpyZyO0GkOe8
         b0MD6fpDcNm1H/ZvgJM6A9QYNXEa/DuaRdsdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727547345; x=1728152145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdzkUQpgo/og7cjoar69c4IL7JL/UbM7NZAGHUR31B4=;
        b=aZWQrMGZpbcsH66oZYvkfvGVLryGhyzNB9uRq5m1UtNsioyhERS0DSKMmZgGgYsFDZ
         UcxxLc+464l0FF2qwX1CwTgCL+9rffrG9VPMKnPAHukDGuIkEThfRyLAEIHpaPkdKPL2
         a6PBivNoVuPQADGNMBqWdonpJLHtc2IxNEEZ71makC4eJ5MT7hPPqzmQZ5Il0EcLF6sl
         nSuG4JOtFWdWcdbDaTZo/mRqzQTSRT95NW/ZzEx+iuYqLpA+Jny7/P+VXCjGsCRkRfqi
         TMRXPc4U4exE5b0hAgSALoqHlPe9FujYU7ZMTEum5JTnk+u1+fakMHZC5dfrTjx9DkcG
         PNzw==
X-Forwarded-Encrypted: i=1; AJvYcCXuTVGLKgKXKaVqrIgIdboWT4cK2tkeIbhQGDkK2GcNNdP6zarVC+i5jz0Ysc0Y58WZMG29s8rO@lists.linux.dev
X-Gm-Message-State: AOJu0YyDz/f0L6ZtXoqfJVTZmwo++VHDiQF4DlFdUvFd6m8yNyVDpDve
	45aAEMK3bNmKAWb0S34mvdFfOkQKwj0XmULPdsSG/g8aSPpuoL4pKXa0ThieUl8=
X-Google-Smtp-Source: AGHT+IEOiqDpOEt00eWVwDUK7uzgqJ9e2hJKfJcp6+t/53C47oOzths00qXcgQ+M9VuwhFHNIm8vqQ==
X-Received: by 2002:a05:6e02:190a:b0:3a3:449b:5981 with SMTP id e9e14a558f8ab-3a3451c1f25mr50771305ab.26.1727547344716;
        Sat, 28 Sep 2024 11:15:44 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a344df2917sm13881235ab.76.2024.09.28.11.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Sep 2024 11:15:44 -0700 (PDT)
Message-ID: <a38ef481-b66e-49d8-bc74-56c1943c2527@linuxfoundation.org>
Date: Sat, 28 Sep 2024 12:15:42 -0600
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Results of the 2024 TAB election
To: Jonathan Corbet <corbet@lwn.net>, tech-board-discuss@lists.linux.dev,
 linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Cc: tab-elections@lists.linux.dev, Kees Cook <kees@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Dave Hansen <dave.hansen@intel.com>, Shuah Khan <shuah@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Lorenzo Pieralisi <lorenzo.pieralisi@gmail.com>, Amit Shah
 <amit@kernel.org>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <87y13bc05z.fsf@trenco.lwn.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <87y13bc05z.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/24 08:39, Jonathan Corbet wrote:
> There were 934 eligible voters in this year's TAB election; 229 of them
> cast ballots.  The results were (with the top five winning seats):

That is about < 25% turnout even after keeping the polls open for more
than week.

> 
>    1 Kees Cook
>    2 Dan Williams
>    3 Miguel Ojeda
>    4 Dave Hansen
>    5 Shuah Khan

Congratulations. I am looking forward to serving.

>   ------------------
>    6 Jakub Kicinski
>    7 Jiri Kosina
>    8 Daniel Borkmann
>    9 Lorenzo Pieralisi
>   10 Amit Shah
>   11 Ricardo Neri

Thank you for tossing your hat in the ring and making this a
competitive election.

> 
> Thanks to everybody who participated.

Thank you Jon for running the elections and allowing a week for
voting.

thanks,
-- Shuah


