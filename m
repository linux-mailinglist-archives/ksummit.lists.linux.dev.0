Return-Path: <ksummit+bounces-1556-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D449547A3
	for <lists@lfdr.de>; Fri, 16 Aug 2024 13:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F02CB217E4
	for <lists@lfdr.de>; Fri, 16 Aug 2024 11:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22FB19D09F;
	Fri, 16 Aug 2024 11:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YyARSGFb"
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FE33EA64
	for <ksummit@lists.linux.dev>; Fri, 16 Aug 2024 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723806749; cv=none; b=jBDNI/mBmZQqeqTJS8db9dUhB5nPAJTqU2yc5S2Fs38zMueaH1rNTYCje7QM3g3dmjaQWhGKt5VL/qH4767lxowi3JGXxqopJYXOgm9mhRZWGFCVHgEBC1/ELvXSNe0tb3mvAWyWjt26YtjPfJRDafrzdMLAxJrxKWd78WDzhPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723806749; c=relaxed/simple;
	bh=ev8gItlxT8GfFSSM6MbqNb6Y6y6p896g9CJuhyNyxNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kY+X5wRTWnAMWj+b34bQHRSaCqcACTqPoWWQ2RmBGXoNnJbRJ8sEQDLk94EVbIJy1Ix+C2IDVdK2QHrGteAIF3S7rB/hqv2+he3ob9zHlPJOpKh6MAv3rQNalEJw8LNNx9esYvCyDApzoHB/yGFupexiWvZOVnXwLmtDV0e7moA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YyARSGFb; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5b9d48d1456so3082384a12.1
        for <ksummit@lists.linux.dev>; Fri, 16 Aug 2024 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723806746; x=1724411546; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vu6p4NVjd5a5X5kDuNbFrcpGswZu1Bkp/8WsnSo57I8=;
        b=YyARSGFba5eQtiY1DFhCI+0usGDeddfhL1I/FmKSo7n5vOG+5x+u/G+W4zvCbH6WU/
         8snmRxTF4/i37kcSCL/CMEVvkZZ4cHf3GoLly/yF0visgEZPHowLgCqdyVr+PvEvNbra
         2zVwJQ1n9j/ilYgS70Azk09K8+ZfyGe6bUuK5/pX64CATKBnJIm4gMpH8nWA2gJF4Yqu
         xBggOdlXUF4SJ7otm4Gw3fbMpQ2ul0fLhYYaNGL2WG45H3Hzd7rcz74dZ8vrkT/gjCeB
         uE97nbrwjyY2FSztDctUZHO4SnfM0vfaPhkSzWNERlBRY32LHMP3Dv5e1Oa0a7s65Yhu
         h2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723806746; x=1724411546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vu6p4NVjd5a5X5kDuNbFrcpGswZu1Bkp/8WsnSo57I8=;
        b=HWlthZPsJpUXMEKQA1x7rcqEoPaSm1xwvJ4m3rzr+SMQdDAAJV9EFJNb0XZNVyhDMn
         eBcnewFCQa4EzAuoAVMi/QF7nLhUNkwn7sYPqZb9sYsvIecgC83/t1m/Wt+mWeHt7rrB
         j2LrTEvajZNRv/idKTdJuWJm/Qvsr4H9vXy5rBQmnuOJik3AhLCva+dww02ub96rP0/x
         elLaKwYh4iS2f3aH8WY6o+sY0M19ITB3EsO45+jetrgKFjpx5L0eeyINbGQrQewLso6k
         qx78cpHmDqtSpN2vCxcXKPvN+H3qtDzoQzCxxWoBJ02AsNw5INOxill6fO4KM3SEuufP
         2lLg==
X-Forwarded-Encrypted: i=1; AJvYcCVXdab1GuXPnM0T4pC4H9hE85aE5IR4k6CbGx1/I8vSnr7LnJwO6n2uflqAGMK7QyQKCmcLNgkT1X+K3qJsk7H8G4zVA8rSYw==
X-Gm-Message-State: AOJu0YwF6A0VqFRbd4k+kx6MmJOmwl34VRTiRwxN0M/L7WBU0j2uk1LN
	Eh6ot0T95Q2Beiait7OhVa06TLTVWErrOEK6cDPnOWgmDzz0gLsbI8aE5eg68W4=
X-Google-Smtp-Source: AGHT+IHrZPj0GDl8aLs3V6+bDceZfINTrVKI0dshA6qcSm27LFmTvVpr+cYRN/sN4aTRDpPHirLLag==
X-Received: by 2002:a05:6402:520d:b0:57d:455:d395 with SMTP id 4fb4d7f45d1cf-5beb3a84f4cmr5719044a12.7.1723806745762;
        Fri, 16 Aug 2024 04:12:25 -0700 (PDT)
Received: from ?IPV6:2a07:de40:a101:3:ce70:3e6f:3b9c:9125? (megane.afterburst.com. [2a01:4a0:11::2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbde7cd4sm2111869a12.39.2024.08.16.04.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 04:12:25 -0700 (PDT)
Message-ID: <2fd48f87-2521-4c34-8589-dbb7e91bb1c8@suse.com>
Date: Fri, 16 Aug 2024 13:12:24 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
To: Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe
 <jgg@nvidia.com>, James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ksummit@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org
References: <668c67a324609_ed99294c0@dwillia2-xfh.jf.intel.com.notmuch>
 <20240726142731.GG28621@pendragon.ideasonboard.com>
 <66a43c48cb6cc_200582942d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <20240728111826.GA30973@pendragon.ideasonboard.com>
 <2024072802-amendable-unwatched-e656@gregkh>
 <2b4f6ef3fc8e9babf3398ed4a301c2e4964b9e4a.camel@HansenPartnership.com>
 <2024072909-stopwatch-quartet-b65c@gregkh>
 <206bf94bb2eb7ca701ffff0d9d45e27a8b8caed3.camel@HansenPartnership.com>
 <20240801144149.GO3371438@nvidia.com>
 <66b2ba7150128_c1448294fe@dwillia2-xfh.jf.intel.com.notmuch>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.com>
In-Reply-To: <66b2ba7150128_c1448294fe@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/7/24 02:06, Dan Williams wrote:
> Jason Gunthorpe wrote:
>> On Wed, Jul 31, 2024 at 08:33:36AM -0400, James Bottomley wrote:
>>
>>> For the specific issue of discussing fwctl, the Plumbers session would
>>> be better because it can likely gather all interested parties.
>>
>> Keep in mind fwctl is already at the end of a long journey of
>> conference discussions and talks spanning 3 years back now. It now
>> represents the generalized consensus between multiple driver
>> maintainers for at least one side of the debate.
>>
>> There was also a fwctl presentation at netdev conf a few weeks ago.
>>
>> In as far as the cross-subsystem NAK, I don't expect more discussion
>> to result in any change to people's opinions. RDMA side will continue
>> to want access to the shared device FW, and netdev side will continue
>> to want to deny access to the shared device FW.
> 
> As I mentioned before, this is what I hoped to mediate. The on-list
> discussion has seem to hit a deficit of trust roadblock, not a deficit
> of technical merit.
> 
> All I can say is the discussion is worth a try. With respect to a
> precedent for a stalemate moving forward, I point to the MGLRU example.
> That proposal had all of the technical merit on the list, but was not
> making any clear progress to being merged. It was interesting to watch
> that all thaw in real time at LSF/MM (2022) where in person
> collaboration yielded strategy concessions, and mutual understanding
> that email was never going to produce.
> 
Well, my experience does not _quite_ match this, but I fully support
the attempt to resolve it.

FWIW, we (ie 'me' with my SUSE distro hat on) are facing similar issues;
every now and again vendors come along asking us to take this very 
important out-of-tree module to allow them to configure their device.
The SCSI stack is _littered_ with vendor-specific commands allowing them 
to reprogram their devices (had a fun experiment once reflashing a 
megaraid HBA to suddenly show up as mpt2sas ... try to code that in 
command effects ...)

So yes, I'd be in favour having an interface for this kind of stuff.
Less sure if there is a generic interface to be found; what we should
try to avoid is having an too generic one (aka: send command with this 
payload, get this result, and heaven knows what it did to the device).
That would surely be useful, but security and operational aspects of
that are a nightmare.

I'd be happy to participate on the discussion at LPC if and when it happens.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.com                               +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich


