Return-Path: <ksummit+bounces-775-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A245BBFCD
	for <lists@lfdr.de>; Sun, 18 Sep 2022 22:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 243E51C2099B
	for <lists@lfdr.de>; Sun, 18 Sep 2022 20:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9712E440E;
	Sun, 18 Sep 2022 20:28:27 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE08D33FF
	for <ksummit@lists.linux.dev>; Sun, 18 Sep 2022 20:28:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7E6962208D;
	Sun, 18 Sep 2022 20:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1663532898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2t+HKm0CCQpQdWq0S5v4Xe3KPe9TbIIsu+iie7Hyac=;
	b=yHDprDyFNMv9RmpwHiprkKWLYEadE8ctWPKgmzPKTwIxBBKrVitTQMWZ1+bZL7fJGIsUBa
	z2WCHHiMjGNSZikHFoO1TIUMa9/c3OHZPnT0M6+tpkuFg9P9PmnxKmqaOGfsobf2lzw5bj
	mFkVj17lhamffJJEcynr3lYlW1ZXx2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1663532898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2t+HKm0CCQpQdWq0S5v4Xe3KPe9TbIIsu+iie7Hyac=;
	b=3UDYifvJcGjaUlWQGPAQIyuilzigZIBmOxElHgpdzUploixS5mn4cfWJN5kjqy2FUc6lej
	75wXi3zdIFLg6DAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58FB21346B;
	Sun, 18 Sep 2022 20:28:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Rx5/FGJ/J2OzeAAAMHmgww
	(envelope-from <vbabka@suse.cz>); Sun, 18 Sep 2022 20:28:18 +0000
Message-ID: <70136115-5e77-c00a-9c29-b06cb8fcef0d@suse.cz>
Date: Sun, 18 Sep 2022 22:26:39 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Tab-elections] Results from the 2022 LF TAB election
Content-Language: en-US
To: Chris Mason <clm@fb.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Cc: tech-board@lists.linuxfoundation.org,
 tab-elections@lists.linuxfoundation.org
References: <87h71984jy.fsf@meer.lwn.net>
 <9755284e-6b57-8340-dbf5-1bb50f036da3@fb.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <9755284e-6b57-8340-dbf5-1bb50f036da3@fb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/22 10:09, Chris Mason wrote:
> On 9/15/22 8:44 AM, Jonathan Corbet wrote:
>> There were 960 eligible voters for the 2022 Linux Foundation Technical
>> Advisory Board election, of whom 267 cast ballots.  The results were:
>>
>> 1. Kees Cook
>> 2. Christian Brauner
>> 3. Jakub Kicinski
>> 4. Dan Williams
>> 5. Dave Hansen
>> ---
>> 6. Chris Mason
>> 7. KP Singh
>>
>> The top five candidates will serve two-year terms on the TAB.  Thanks to
>> all who participated in this years election; please reach out to
>> tab-elections@lists.linuxfoundation.org if you have any questions.
> 
> Thanks for running the elections this year, and also thanks to Laura 
> Abbott for working through our transition to the fully online elections.
> 
> Congratulations to all the winners, I think the online process worked 
> really well, and I don't miss carrying around the ballot scanner in my 
> luggage at all.

Hi,

I was wondering, as the voting is fully online now, does it have to
still overlap LPC exactly? For example I happened to miss the most
important e-mail from CIVS in my inbox during the conference, and while
I tried to login there by the activation code, I could only see there I
was invited to 2021 poll but didn't see the 2022 one (nor I can see it
there now; I assume the link from the CIVS mail would have worked, but
too late now).

Also, since it seems many of the nominations were last-minute [1] I only
saw two of them by Friday. So even if I didn't miss the CIVS e-mail, I
would have to read through the manifestos and rank the candidates
quickly during LPC, which wouldn't have been ideal.

So maybe the vote could be scheduler for the week before LPC? And then
both the new and old TAB members that happen to travel there could meet
there knowing the results already.

But maybe there are still other benefits to voting during LPC that I'm
not aware of, so this is just my suggestion. Thanks.

[1]
https://lists.linuxfoundation.org/pipermail/tech-board-discuss/2022-September/thread.html

>>
>> jon
>>
>> P.S. On a personal note: a special "thank you" to Chris Mason, who has
>>       led the TAB well for many years.
> 
> Oh, it's my turn to thank this year's TAB for taking over the reins, and 
> also everyone that has put up with me over the years.  I've learned a 
> great deal from my time on the TAB, and I'm looking forward seeing you 
> all on the lists and at future conferences.
> 
> -chris
> 
> 
> 


