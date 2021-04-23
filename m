Return-Path: <ksummit+bounces-162-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 954D6369CE3
	for <lists@lfdr.de>; Sat, 24 Apr 2021 00:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 678361C0D53
	for <lists@lfdr.de>; Fri, 23 Apr 2021 22:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4B72FA9;
	Fri, 23 Apr 2021 22:41:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E168A2FA4
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 22:41:40 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id q25so6867386iog.5
        for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 15:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KdYt1sOQfw47t/qxUinFjndcDtxCxAr+kLh7clqdygA=;
        b=XguUHkciMDWR4RySvjRdytKznYp/A8sByKhbJTV8PliYLReEHf1wadky0u2EWe+flW
         eHVs/oCGA1il8AEVK6YfeBL4Tbsrot/Wj4nFrMTi0K05+2HbV4v+J9QgqpKTZZTceajL
         3dnuTB6cbVzVp/cpKslyaBM0DEmQF6ceN+w18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KdYt1sOQfw47t/qxUinFjndcDtxCxAr+kLh7clqdygA=;
        b=cv3utwCWSeTrp0n2IzSAA4xWdLCNnCfKKZz9AgaEQcp9AqAreijLli+1joB8xdBv4t
         Q2NeCOwSNmMgdVp8wZXAnKONlIxmJRTcpZ59xduTKF+e5gVpW8dor7dQSB2aaDVa8aSN
         aWFQYTDHxJ9Clo6Pimf7zfhWhjxkSJxeAQr6ZAKh2bVn0vNwD0K39n4cl1POrGBBjWFJ
         R+NcgcNYt8++QBGls+Y1ko5ugu62LI1RZLXRStD3QldnOvAZgB+UFMvSpiBip7CbnwU3
         YtEE1bLyu1fz7q0S5mMzy6a847cjv87WArocWE8zEiNudmhsHtmfAH8z9KVNH+RnmrKe
         DuBw==
X-Gm-Message-State: AOAM53267j3yEBZBjHjHQY31U+/UeFN3cd3ZS2LACTykOvELsr+32P2D
	i9S1uxms/6d0b/QogEsMbFMGiA==
X-Google-Smtp-Source: ABdhPJyxStjxJ6g1OLKqEMlc/21APKpWx/TN2D+5temdi2dgXAaU6I4k2nvDwMWHAVTKewPcIvJiYw==
X-Received: by 2002:a5e:930d:: with SMTP id k13mr4994752iom.61.1619217700029;
        Fri, 23 Apr 2021 15:41:40 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id b6sm3148628ilh.82.2021.04.23.15.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 15:41:39 -0700 (PDT)
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, James Morris <jmorris@namei.org>,
 Julia Lawall <julia.lawall@inria.fr>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Roland Dreier <roland@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home>
 <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
 <alpine.DEB.2.22.394.2104212150230.20674@hadrien>
 <20210421132824.13a70f6c@hermes.local>
 <alpine.DEB.2.22.394.2104212233450.20674@hadrien>
 <d95ee281-4dc0-c5c1-ec87-81d83f44979@namei.org>
 <CAMuHMdU=c2bY1_sq+rSh1fON5QhNx8xWqMQLT+cD0BpqG0RtCg@mail.gmail.com>
 <20210422115511.60d1f735@coco.lan> <YIFpl4iAe/0zOTsh@unreal>
 <24762711-0252-f7d2-4e41-3eb1e27955ea@linuxfoundation.org>
 <20210423110643.4b28c29b@coco.lan>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a0572704-05c9-d9a4-c930-ba3de573f8d9@linuxfoundation.org>
Date: Fri, 23 Apr 2021 16:41:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210423110643.4b28c29b@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/23/21 3:06 AM, Mauro Carvalho Chehab wrote:
> Em Thu, 22 Apr 2021 09:38:03 -0600
> Shuah Khan <skhan@linuxfoundation.org> escreveu:
> 
>> On 4/22/21 6:18 AM, Leon Romanovsky wrote:
>>> On Thu, Apr 22, 2021 at 11:55:11AM +0200, Mauro Carvalho Chehab wrote:
>>>> Em Thu, 22 Apr 2021 09:34:38 +0200
>>>> Geert Uytterhoeven <geert@linux-m68k.org> escreveu:
>>>>   
>>>>> On Wed, Apr 21, 2021 at 11:50 PM James Morris <jmorris@namei.org> wrote:
>>>>>> On Wed, 21 Apr 2021, Julia Lawall wrote:
>>>>>>> The apology states that they didn't detect any vulnerabilities.  They
>>>>>>> found three non exploitable bugs and submitted incorrect patches for them.
>>>>>>> When the patches received some positive feedback, they explained that the
>>>>>>> patches were incorrect and provided a proper fix.
>>>>>>>
>>>>>>> So they damaged trust, but not actually the Linux kernel...
>>>>>>
>>>>>> The issue is that there was no consent and no coordination, so we don't
>>>>>> know the scope of the experiment and whether it was still continuing.
>>>>>>
>>>>>> We are this not able to trust anything the group said about what they'd
>>>>>> done or not done, until now [1].
>>>>>>
>>>>>> In all probability there is nothing further amiss but we would not have
>>>>>> expected them to use fake gmail accounts to submit bugs to the kernel
>>>>>> either.
>>>>>>
>>>>>> It's now on us to audit all of their known contributions, because we don't
>>>>>> know the scope of the experiment, which was based on the use of deception,
>>>>>> and we can't make any assumptions based on what they have said.
>>>>>>
>>>>>> We also need the identity of the 'random' gmail accounts they used,
>>>>>> although this should be handled by a small trusted group in private, as it
>>>>>> will lead to privacy issues for kernel maintainers who responded to them
>>>>>> in public.
>>>>>
>>>>> What do we gain by blindly reverting all[1] umn.edu patches, and
>>>>> ignoring future patches from umn.edu?
>>>>> I think all of this is moot: other people may be doing the same thing,
>>>>> or even "in worse faith".  The only thing that helps is making sure
>>>>> patches get reviewed[2] before being applied.
>>>>>
>>>>> [1] Judging from the new review comments, many of the 190 patches
>>>>>       to be reverted were real fixes.
>>>>
>>>> The reverted ones for media (29 patches) didn't contain any malicious code.
>>>> One was useless (because the media core already fixes the pointed issue),
>>>> but the other ones were valid patches.
>>>
>>> I'm sorry that I didn't check all media commits, but this random commit
>>> 467a37fba93f ("media: dvb: Add check on sp8870_readreg") has a bug and
>>> broke sp8870 (I don't know what is it).
>>>
>>> diff --git a/drivers/media/dvb-frontends/sp8870.c b/drivers/media/dvb-frontends/sp8870.c
>>> index 8d31cf3f4f07..270a3c559e08 100644
>>> --- a/drivers/media/dvb-frontends/sp8870.c
>>> +++ b/drivers/media/dvb-frontends/sp8870.c
>>> @@ -293,7 +293,9 @@ static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
>>>           sp8870_writereg(state, 0xc05, reg0xc05);
>>>
>>>           // read status reg in order to clear pending irqs
>>> -       sp8870_readreg(state, 0x200);
>>> +       err = sp8870_readreg(state, 0x200);
>>> +       if (err)
>>> +               return err;
>>>
>>>           // system controller start
>>>           sp8870_microcontroller_start(state);
>>>
>>>
>>>      67 static int sp8870_readreg (struct sp8870_state* state, u16 reg)
>>>      68 {
>>>      69         int ret;
>>>    <...>
>>>      77         if (ret != 2) {
>>>      78                 dprintk("%s: readreg error (ret == %i)\n", __func__, ret);
>>>      79                 return -1;
>>>      80         }
>>>      81
>>>      82         return (b1[0] << 8 | b1[1]);
>>>      83 }
>>>
>>> The valid check should be if (err < 0);
>>>    
>>
>> Correct. Like all the other callers of sp8870_readreg() do with
>> its return. Non-zero return is valid for this routine.
> 
> This particular patch is completely broken and should be reverted.
> Also, probably a comment should be added to ensure that people won't
> try to send us similar "trivial" fixes.
> 
> Basically, the logic at sp8870_set_frontend_parameters() is called
> when tuning into a new DVB-T channel. the call there for
> 
> 		sp8870_readreg(state, 0x200);
> 
> Seems to be there just to reset IRQ registers. It should _not_ check
> the return results on this particular case.
> 
> Yet, this driver was written back in 1999 for a DVB-T device that
> used to be available on that time. Just one driver (av7110) can
> use such tuner. Those PCI chipsets had stopped produced a very long
> time ago. Even the company that used to produce av7110 has long
> gone, more than 17 years ago.
> 
> I guess it is time to get rid of av7110 and the ancillary drivers
> used only on it.
> 

Mauro,

Quick search shows me the following. Are you saying all of these
can be removed??

drivers/media/dvb-frontends/Kconfig
config DVB_SP8870

grep AV7 drivers/media/pci/ttpci/Kconfig

config DVB_AV7110_IR
	depends on RC_CORE=y || RC_CORE = DVB_AV7110
	default DVB_AV7110
config DVB_AV7110
	tristate "AV7110 cards"
	  Support for SAA7146 and AV7110 based DVB cards as produced
config DVB_AV7110_OSD
	bool "AV7110 OSD support"
	depends on DVB_AV7110
	default y if DVB_AV7110=y || DVB_AV7110=m
	  The AV7110 firmware provides some code to generate an OnScreenDisplay
	tristate "AV7110 cards with Budget Patch"
	depends on DVB_AV7110
	  SAA7146+AV7110 based cards (DVB-S cards). This
	  standard AV7110 driver prior to loading this

thanks,
-- Shuah

