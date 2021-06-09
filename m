Return-Path: <ksummit+bounces-179-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BC23A102D
	for <lists@lfdr.de>; Wed,  9 Jun 2021 12:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 9BCE63E0F39
	for <lists@lfdr.de>; Wed,  9 Jun 2021 10:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03702FB5;
	Wed,  9 Jun 2021 10:37:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC1C72
	for <ksummit@lists.linux.dev>; Wed,  9 Jun 2021 10:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623235060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GXhuyr8heOXQm5DhE+A2Fq3L85+vZLqOuEIP9E5CaCk=;
	b=QpF7HR/7zOGh61YOtlY8dqcVkUj+yYVo4cmQJvAskdE/cJnbqHCDWYPV11ObBsIUrvcyT3
	pysNVP/he+CVTa66STgetI7XHG5fjnSOw3u2IFroXl+sGkTRKqZVXKW6hm+MTP+b/Lghub
	in61uffd3xSL54ub9vSD66/PiBsF31g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-uC7ZCQymOj2iGZZ33o0Ktw-1; Wed, 09 Jun 2021 06:37:39 -0400
X-MC-Unique: uC7ZCQymOj2iGZZ33o0Ktw-1
Received: by mail-wr1-f72.google.com with SMTP id l13-20020adfe9cd0000b0290119a0645c8fso7604983wrn.8
        for <ksummit@lists.linux.dev>; Wed, 09 Jun 2021 03:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GXhuyr8heOXQm5DhE+A2Fq3L85+vZLqOuEIP9E5CaCk=;
        b=OsyIwuS4V5gtqqudChMysXpBZ3OtX8/Scv3RbarhIptMCM0NRDusKwoneCHtxuS1TL
         UbxuDoZmR33Txr6P94FMROsA1qZG74dLXeXWxoLE/FsQbKAE2C0aq197asuFo25ed3mf
         4R6jxpAfL+QScG44d0EsaVZ5HAN8zXGOnJrFwfPc6nQs3mOBaN+q4O8rhrRtImcRzUFx
         fxLY6wXfr2v4+UR1Ut6pBpm5EWn0BcGRPLu8vDm5pv8dy8FYU3P3PiBXe9CehViCPgDR
         H7P4T3sn9ogbp0kOk235fPHEGPI96TTgLc1RTx/O5Y/4BQHJHJoAaBiBdvC6eGMSTQE5
         TQnQ==
X-Gm-Message-State: AOAM530FMaUB2KlFcQCLlndToqCG3/esT2ixCFHXwuA+7D3nwA//9HmA
	lXDuP3N/ngd0MAJW00YXbELEOQsVvvovdNeKLoKmVqAHNbg63yJwa5T6+vZmX4b78EX5T8Z7pxi
	U0VFu8FR8MYVzvpjAuQ==
X-Received: by 2002:a5d:4984:: with SMTP id r4mr27081037wrq.152.1623235058405;
        Wed, 09 Jun 2021 03:37:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxx5QPJlJibMJq5KkrldmC0yuk9Qgb+mpFY3QEuhdJz4/D402+HjHMF51cTVSM1EXp++YpYXw==
X-Received: by 2002:a5d:4984:: with SMTP id r4mr27081015wrq.152.1623235058237;
        Wed, 09 Jun 2021 03:37:38 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
        by smtp.gmail.com with ESMTPSA id l5sm5668999wmi.46.2021.06.09.03.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 03:37:37 -0700 (PDT)
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>
Cc: Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org
References: <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
Date: Wed, 9 Jun 2021 12:37:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.05.21 16:58, James Bottomley wrote:
> On Thu, 2021-05-27 at 15:29 +0200, Greg KH wrote:
>> On Thu, May 27, 2021 at 03:23:03PM +0200, Christoph Lameter wrote:
>>> On Fri, 30 Apr 2021, Theodore Ts'o wrote:
>>>
>>>> I know we're all really hungry for some in-person meetups and
>>>> discussions, but at least for LPC, Kernel Summit, and
>>>> Maintainer's Summit, we're going to have to wait for another
>>>> year,
>>>
>>> Well now that we are vaccinated: Can we still change it?
>>>
>>
>> Speak for yourself, remember that Europe and other parts of the world
>> are not as "flush" with vaccines as the US currently is :(
> 
> The rollout is accelerating in Europe.  At least in Germany, I know
> people younger than me are already vaccinated. 

And I know people younger than you in Germany personally ( ;) ) that are 
not vaccinated yet and might not even get the first shot before 
September, not even dreaming about a second one + waiting until the 
vaccine is fully in effect.

So yes, sure, nobody can stop people that think the pandemic is over 
("we are vaccinated") from meeting in person. Just make sure to not 
ignore the poor souls that really won't be traveling this year, because 
"we are not vaccinated".

-- 
Thanks,

David / dhildenb


