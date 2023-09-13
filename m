Return-Path: <ksummit+bounces-1134-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 493E179EFCD
	for <lists@lfdr.de>; Wed, 13 Sep 2023 19:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A810E1C21547
	for <lists@lfdr.de>; Wed, 13 Sep 2023 17:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADC4200A4;
	Wed, 13 Sep 2023 16:59:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733D6AD52
	for <ksummit@lists.linux.dev>; Wed, 13 Sep 2023 16:58:59 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68fb7074348so3561266b3a.2
        for <ksummit@lists.linux.dev>; Wed, 13 Sep 2023 09:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694624339; x=1695229139; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VhP70vpj5PWFB+iYZacvcg8zeDYG8Ksg0ttAfb+9X8o=;
        b=leZw3MDRClD9NTbYzuQDApDRZcpuuojc3vHUX7tA9N0upPPi3IP1ikUwGPKYmwBNdl
         G9NSFsVEfk9gIsmZwtTERPlDnPi/JEWdMH1pfSt/B3Hde5QKv17Bh181Gubba59zAFem
         2diDOAOpeFYZMxaFPIwmn2bj2RcWDXEdmOQUbWglJJROHBHaGr/76KFgEQouMZsjxDCs
         M83M06GeTK78wl7VmgRcxXwMXJoBO5KfjSDFKKrBmv2u4XI2aT6Mt2PP6t5klnuJ+kTv
         rFgq9Dky5fRhFSVYo7KLu6mOIHWRAD171I2ligAbtGPAxPzMHu8Dh1lrJ0S58IN3NVUR
         jlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694624339; x=1695229139;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhP70vpj5PWFB+iYZacvcg8zeDYG8Ksg0ttAfb+9X8o=;
        b=lEY4Uwe5DmatEcp7g5xa8Ka78JvtP5Qd/b4D7Pj6V4NBCvpxKhZVfz4/0JXcWIs8sV
         pV8U/R3vMmCX+KJ1Bm9ILZC0IyJ3e1sFx/ozEk5YwFRyZNp12AL2GaWDTWJXdx4YYbe+
         6VvPMbMY8taQ1uMN0WLJveUIRVpZDEhnjCa5Ji2nq4plM/B6kaZR0IlAIwaqC1Z6sELH
         VXpv19nDWSNyh6xMUWFOvzg+mMJR2GmrT+v5H8m/KcYTaQiQzeibep6PeQKXLKbYT8HI
         5BzSFNMSKvxBj1EnLHCrr0AfzryAWbRf3hbTUily1cY5Mn0W6SvxdNci9S8zp1PsrYHo
         vy3g==
X-Gm-Message-State: AOJu0YzYJxHdmgT0gPFqsl5mzTk1wSzfIBV5YxE89EktKJs5eEj5roGf
	Jo7c/8hTdDDTCzKuyIf3iBs=
X-Google-Smtp-Source: AGHT+IEdNGA7PfuA3xFF1w8R7AbLW+d4wMBhhxXFmjkkmb8MK8Uh2by7i6flZmzYEosSJae2BQExGQ==
X-Received: by 2002:a05:6a20:4327:b0:13f:1622:29de with SMTP id h39-20020a056a20432700b0013f162229demr3210638pzk.7.1694624338645;
        Wed, 13 Sep 2023 09:58:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n23-20020aa79057000000b0068782960099sm262425pfo.22.2023.09.13.09.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 09:58:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3fb55cc7-8c50-2ba1-3e51-483b19a66f91@roeck-us.net>
Date: Wed, 13 Sep 2023 09:58:56 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Content-Language: en-US
To: Eric Sandeen <sandeen@sandeen.net>, Steven Rostedt <rostedt@goodmis.org>,
 Dave Chinner <david@fromorbit.com>
Cc: Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
 linux-fsdevel@vger.kernel.org
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area>
 <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlFwHQhJS+Td6Cz@dread.disaster.area>
 <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/23 09:43, Eric Sandeen wrote:
> On 9/7/23 6:18 AM, Steven Rostedt wrote:
>> On Thu, 7 Sep 2023 13:38:40 +1000
>> Dave Chinner <david@fromorbit.com> wrote:
>>
>>> Hence, IMO, gutting a filesystem implementation to just support
>>> read-only behaviour "to prolong it's support life" actually makes
>>> things worse from a maintenance and testing persepective, not
>>> better....
>>
>>  From your other email about 10 years support, you could first set a fs to
>> read-only, and then after so long (I'm not sure 10 years is really
>> necessary), then remove it.
>>
>> That is, make it the stage before removal. If no one complains about it
>> being read-only after several years, then it's highly likely that no one is
>> using it. If someone does complain, you can tell them to either maintain
>> it, or start moving all their data to another fs.
>>
>> For testing, you could even have an #ifdef that needs to be manually
>> changed (not a config option) to make it writable.
> 
> This still sounds to me like /more/ work for developers and testers that
> may interact with the almost-dead filesystems, not less...
> 
> I agree w/ Dave here that moving almost-dead filesystems to RO-only
> doesn't help solve the problem.
> 
> (and back to syzbot, it doesn't care one bit if $FOO-fs is readonly in
> the kernel, it can still happily break the fs and the kernel along with it.)
> 
> Forcing readonly might make users squawk or speak up on the way to
> possible deprecation, but then what? I don't think it reduces the
> maintenance burden in any real way.
> 
> Isn't it more typical to mark something as on its way to deprecation in
> Kconfig and/or a printk?
> 

I think that commit eb103a51640e ("reiserfs: Deprecate reiserfs") is a perfect
and excellent example for how to do this.

Guenter


