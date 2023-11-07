Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 748147E4655
	for <lists@lfdr.de>; Tue,  7 Nov 2023 17:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0747F2816A1
	for <lists@lfdr.de>; Tue,  7 Nov 2023 16:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E3E31A79;
	Tue,  7 Nov 2023 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fAAXhAZ1"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F276B30FA9
	for <ksummit@lists.linux.dev>; Tue,  7 Nov 2023 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699375405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1Fsyd7lByzw3EcegG1QFfWfW7xeHnMxnB3GqbrgmRbs=;
	b=fAAXhAZ1Gk930jZe1kxlTEpuCwHUzf0eeoyahbyuvipZQ8TDS2mXgAvTfH5v5KYacyHbeq
	DeCVR+SdVjvH+7BQj/qgYw7D3UpdSMgu0I5/pmOhqJePwPvnnpqc4CS84kIngbLW1vDJEF
	WwqPDydnf32DR1yhYJBG0pYcyvJuG7A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-tZ7ssBB_OP6bUCOB1ufKVQ-1; Tue, 07 Nov 2023 11:43:24 -0500
X-MC-Unique: tZ7ssBB_OP6bUCOB1ufKVQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4094d1e52daso38570745e9.2
        for <ksummit@lists.linux.dev>; Tue, 07 Nov 2023 08:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699375403; x=1699980203;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Fsyd7lByzw3EcegG1QFfWfW7xeHnMxnB3GqbrgmRbs=;
        b=FsqP0WZz3CWOvg8eMwsSj/HMsOWS/5+hWVaaveQ2IqaLT8qKTPXMZmpErJ6lUygXnF
         JgH/BhXX/mP0oxTdFTvZanVWIBoqAJGCjqUSaQUbyjnboDnh6COlavYeAVPUGU+ZoHIg
         CCEqt+riUwnNBUCLc6H+y5WTtbaaZz3GKg8RrI8nHrSUqurygXYco8rqFxJEBFHlVFbd
         NTQVPyJyqcdsztDrkfA1l0LK5CCjS5xxW2eVIDtXiDKNuBBzvD17dkYB8tWyO63TmpIP
         ApHIYDSGk3xX2Cx6VUV3dAAr4xavda1iz9/3VzxOIe4gGbr1/t93/LtELwFsp0PYWfid
         50Lg==
X-Gm-Message-State: AOJu0YzXKq34WPGXCoH2zhRiGvJjFjgZPbh8NpDQYooGxkoZMfEVPttw
	76mAQVsFAMjfgnStTWkPDrMDgbQjM6BuKHBid5Cuu66lfeyl8h2VsKezpKkyZducSSUOrswo0vi
	8G7+zG6d8uHyoWFN2IQ==
X-Received: by 2002:a05:600c:198a:b0:408:3ab3:a029 with SMTP id t10-20020a05600c198a00b004083ab3a029mr2830124wmq.38.1699375402788;
        Tue, 07 Nov 2023 08:43:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERKCgTxA8Yu9vsrW0fC1dTmtM+jOrBXIjOF2AHtU+qdFnKm142kowrLepQATF8vq9ITJKucQ==
X-Received: by 2002:a05:600c:198a:b0:408:3ab3:a029 with SMTP id t10-20020a05600c198a00b004083ab3a029mr2830106wmq.38.1699375402431;
        Tue, 07 Nov 2023 08:43:22 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id r1-20020a5d4941000000b0032da8fb0d05sm2789580wrs.110.2023.11.07.08.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 08:43:21 -0800 (PST)
Message-ID: <cefe4c99-2af9-4e22-a448-801a7080fc48@redhat.com>
Date: Tue, 7 Nov 2023 17:43:20 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Julia Lawall <julia.lawall@inria.fr>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, users@linux.kernel.org, ksummit@lists.linux.dev
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <ZUluOoDjp/awmXtF@duo.ucw.cz>
 <34eda1fe-0e14-4f12-b472-d152eadb7b88@redhat.com>
 <20231107101513.GB27932@pendragon.ideasonboard.com>
 <mafs0o7g5hiba.fsf_-_@kernel.org>
 <b36d7b18-2092-1848-e22a-7e34588db0f5@inria.fr>
 <20231107-skilled-calculating-frigatebird-8db1bb@nitro>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20231107-skilled-calculating-frigatebird-8db1bb@nitro>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/23 17:35, Konstantin Ryabitsev wrote:
> I assume you're asking if following links to lkml.kernel.org/r/<msgid> 
> is still going to find the thread? If that's the case, then yes, it's 
> really just a redirect to lore.kernel.org/all/, which aggregates 
> everything across all lists indexed by lore.kernel.org. You can 
> similarly search in /all/ for the subjects matching commits if you don't 
> have a Link:. In other words, this functionality is not affected by 
> which list the patches were sent to.

What about _pulling_ all patches from public-inbox?  Right now the git 
repos under https://lore.kernel.org/lkml/ do not catch everything, but 
it's close enough.  There would be no https://lore.kernel.org/all/1.git/ 
and, even if there were, there is no easy way to filter out non-Linux 
projects.

Paolo


