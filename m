Return-Path: <ksummit+bounces-1647-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2350E9AE90B
	for <lists@lfdr.de>; Thu, 24 Oct 2024 16:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C81E1F23434
	for <lists@lfdr.de>; Thu, 24 Oct 2024 14:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCCA1E283E;
	Thu, 24 Oct 2024 14:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWTc0pfo"
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435B17CF16
	for <ksummit@lists.linux.dev>; Thu, 24 Oct 2024 14:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729780746; cv=none; b=RBMdlc9vByLaQbt/bkokFxQ/Rzx69rUX8yYsHVv0BYF/rq9qgGB3XIXJWSiVsChM2wqZTr7t0KyqC6TdUh93LqL7KKLmuq9JV5V+bjRLp/3ysKrR4FJP7NK0JuBeiFmBwX66LmyP7CSzMrkIUC9heTo4icz4fKMyi8Iqb1RvDhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729780746; c=relaxed/simple;
	bh=yft2eH3PwhDAPn+5umf0+KSWwA/2wI/k3ac3kvRNyeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IwYPGtEDZnntX6Cf05wH/gjVUFs0kyAGHYAjNkueeJAOJOPeBjTMToXApEH9US90VcIfYqpC6FlEVEQB9/19aXL1cy24gmMt3mUa/Wih6lUi8Z0fb4mCwp1g2lgCy0h54P/gEnWE5HIjfezC8WwzJGTC5lJA/D+lnGjV/34Oovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWTc0pfo; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cf3e36a76so9524885ad.0
        for <ksummit@lists.linux.dev>; Thu, 24 Oct 2024 07:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729780743; x=1730385543; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/ATU71+BVeoyf6nBgmcl5vNSTnxt/bEaMKpjaixxDNE=;
        b=JWTc0pfouXP9IpF1nu/te9SGXYqwzb66nXdFSuCCf2Xh9qImOJpUoUwjLWXsLZHUEk
         zNlEOKMDud9WT95o+RSlhMinOPM1VoalhDio7TWHEQQ8NjDVNHJEJVGZ2ZPR883Bwmxj
         HaMK2xasqIyE7sNmhKm+pzYfiNYrMx5PiRr1bil0g6VKiZ1KoGJWo2Q/Ql3djs3DWFrl
         R2I9RGh7HOY7g18Xnp324lk+GL0Ith8DbGXuFvuMx4ZTb6DbRZ49MGyS93NTnUmW08Oh
         tVxANhY0ipUnbj90dOwjeLMOyt+KdphKlpNCGC58cPR9C3yiAQxZr+Zj/68MKGAPqCEO
         oUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729780743; x=1730385543;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ATU71+BVeoyf6nBgmcl5vNSTnxt/bEaMKpjaixxDNE=;
        b=QtD1NtXKon1LvCIYHucJgHaruNxsSgkX4/5LfVMTDTjbS4qWeAvQaUp4JMRUyoxPDH
         GRlRUQAx7lTszFUfFet3Oa3AWGp3dZeWc3tNwaTkG2+IOEbiwkQpS4H0Wk41q1g4j2TF
         s8IlPC2aD+HztPG7B4tWUofweWZOFlXPKa3hXVMxcdCUD9mMxChhPPeNRdlUYuy87Njb
         g1sBTlMP7R/Gt5Q4RJu9rKz7BYuBOaC8nZA48AITjCnq1nXEz2Q7Zf3BFTDmf0ZWoIRA
         kArCo8mZJRJ3bp+au0Opu8dZyWwhM98nx46Z0bdn8nt2cTA+DNPULzJ1ybg0Ozu6Cyly
         qf3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1OcNb8SIuss2n+js944bIYAqId6LRV9s8HN2eEeAa4Uso8ENtrMOgxAtJWAylclEDG5jJIyBa@lists.linux.dev
X-Gm-Message-State: AOJu0YxqXF63ulY3pzx48j8Sau/Msp+Snh3b0mSfO576qUutzRq5Bg41
	1sY3laR2H4m/OwD/SSC4XXhwapskpDhSd7D4rlGRvTkQ7WNUiYDf
X-Google-Smtp-Source: AGHT+IEWp+hMjVRkGBLQ9PmqyMXu+fLM3QYyl3e6XmyeWerflmBQOBf+ffMBnhfO38EGp+Itmfjbyw==
X-Received: by 2002:a17:902:d2ce:b0:20c:7eaf:8945 with SMTP id d9443c01a7336-20fa9e5f15dmr86420695ad.28.1729780743401;
        Thu, 24 Oct 2024 07:39:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee6474sm73603825ad.7.2024.10.24.07.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:39:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <82eecf18-0a71-4c16-8511-bc52fb61f421@roeck-us.net>
Date: Thu, 24 Oct 2024 07:39:00 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linus-next: improving functional testing for to-be-merged pull
 requests
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, Kees Cook <kees@kernel.org>,
 Sasha Levin <sashal@kernel.org>, torvalds@linux-foundation.org,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZxZ8MStt4e8JXeJb@sashalap>
 <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
 <ZxdKwtTd7LvpieLK@infradead.org>
 <20241022041243.7f2e53ad@rorschach.local.home>
 <ZxiN3aINYI4u8pRx@infradead.org>
 <20241023042004.405056f5@rorschach.local.home>
 <CAMuHMdUxrULbo=A77DFDE4ySbii3jSMuh8xVvUXaqyCnwEAU-w@mail.gmail.com>
 <20241023051914.7f8cf758@rorschach.local.home> <8734km2lt7.fsf@mail.lhotse>
 <20241024010103.238ef40b@rorschach.local.home>
 <07422710-19b2-412b-b8d5-7ec51b708693@roeck-us.net>
 <20241024024928.6fb9d892@rorschach.local.home>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241024024928.6fb9d892@rorschach.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/24 23:49, Steven Rostedt wrote:
> On Wed, 23 Oct 2024 22:16:31 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> I do get notifications, so it is still running.
>> Its configuration is (still) at https://github.com/intel/lkp-tests.git,
>> so you can check yourself if your current repositories and branches are
>> listed (and send a pull request to update it if needed). I see
>>
>> repo/linux/rostedt-kconfig:owner: Steven Rostedt <rostedt@goodmis.org>
>> repo/linux/rostedt-ktest:owner: Steven Rostedt <rostedt@goodmis.org>
>> repo/linux/rostedt-trace:owner: Steven Rostedt <rostedt@goodmis.org>
>>
>> so at least some testing should still happen. I did notice though
>> that "notify_build_success_branch:" is only set in one of the files,
>> so you might not get notified if a build was successful in the other
>> two.
>>
> 
> Thanks for the update!
> 
> Yeah, I started using topic branches (requested by Linus) and I didn't
> update the success notifications. That explains why I don't receive
> them anymore.
> 
> Now I have to ask. What's the benefit of pushing to linux-next over
> waiting for the zero-day bot?
> 

I push my changes into the same branches that are checked by 0-day
and pulled into linux-next. linux-next shows interference with other
branches. Once in a while I do get a notification telling me that
one or more of the patches interfere with other patches, so I know that
something happened, and I can prepare for that for the next commit window.

Testing-wise, I do run build and boot tests on linux-next (the same tests
as those running on release candidates), so I do know what is wrong there
and (which did happen a couple of times) if a patch in one of my trees
is responsible.

Yes, that means that in many cases I do know ahead of time which problems
are going to pop up in the mainline kernel. But I don't have the time
tracking those down when seen in linux-next - there are just too many
and, as already mentioned, that would be a full-time job on its own.
Also, it happens a lot that they have been reported but the report was
ignored or missed. On top of that I found that _if_ I am reporting them,
the receiving side is at least sometimes either not responsive to almost
abusive, so for the most part I gave up on it (and frankly I found that
people tend to be _much_ more responsive if one Linus Torvalds is listed
in Cc:).

Note that I do collect known fixes in my 'fixes' and 'testing' branches,
primarily to have something clean available to keep testing. Linus even
pulled my fixes branch once directly because the responsible maintainers
didn't send pull requests to him for weeks.

Guenter


