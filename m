Return-Path: <ksummit+bounces-1302-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A7890AC80
	for <lists@lfdr.de>; Mon, 17 Jun 2024 13:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2748D28BC57
	for <lists@lfdr.de>; Mon, 17 Jun 2024 11:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34D6194C7C;
	Mon, 17 Jun 2024 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="tbi3YfJv";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="B54SUnV7";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="f3RiCDK/";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="B7Lme6qb"
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0962D194AD0
	for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718621987; cv=none; b=drDbnHXrMHE2BGA34oV4fHb7Z4VDOY2kWuutceXmShWP14QYVvSPazO7yHpKT1RvCEDJFUYD3k8zOtbiWn2XGvhVGEhmDvfpogG/eDJnJs2S5BERoUkErIcFT7MWOQGvy7iO+GjMIoe8huK6L2fzubvQNsB5wq6kJtRlJIwWlLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718621987; c=relaxed/simple;
	bh=j3at9Ltjc7bXqgB3btk29HIs6G+oZQlMC5t94VYjhe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=py1IdcUeJlxQsq6poOPg/pzSloS1Y78wZM3sb0T+E48TJXBQgWXqXn06n04O4NRIi7UrO/Tyqy1pMUfJ3C4b5y0mo0LUMg7uLra5tXVJsjCN12/gsj+l8+o84BdCUXwLrEyy2Qxs7OV1dWRsCHW0S2MMdeiXPjd+7zB5hBkWV/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=tbi3YfJv; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=B54SUnV7; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=f3RiCDK/; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=B7Lme6qb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DAD943806F;
	Mon, 17 Jun 2024 10:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1718621983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gkb+fkSv1S6NaUNT39Rj0PoNOJ2fqFHQTIb6C3WCtWQ=;
	b=tbi3YfJvqmVFOFGRM6srs6fT7RlDZChr7ADL80p5bSQrQQkXrFx1CjH+S89vTRclim1pMJ
	5YXEhnh9URMMF3Pycg2IEkY8O+tkhfzYYVipNEj3gWapaK7TK66LzZLCUYM06aPmekljAc
	rh+QG/ml3pSt725y07tae/W8e4xvmeI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1718621983;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gkb+fkSv1S6NaUNT39Rj0PoNOJ2fqFHQTIb6C3WCtWQ=;
	b=B54SUnV7+jwf+0EjurVBhqH/OpgSyo9fgGhRwH2Ew5Os4u6cJ87QXF8tT95xSQ8pKB0/B1
	vaNXSlzGYqsh3fBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="f3RiCDK/";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=B7Lme6qb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1718621982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gkb+fkSv1S6NaUNT39Rj0PoNOJ2fqFHQTIb6C3WCtWQ=;
	b=f3RiCDK/DsedLAkNYqELz85R0wFDPbpw+ismUk6B+64dwmQzWxhwmFez5NzV7sDb1P1mL1
	Rn/0aChaJ6Xxh4XVhfZyVI4bFkJEFI/cCoB0UNvpjhoxtSR5sZ3Vhq4k44f098taWTMZWI
	NKVd7NdGW4JR+N7d0lW65Of7NYIgf3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1718621982;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gkb+fkSv1S6NaUNT39Rj0PoNOJ2fqFHQTIb6C3WCtWQ=;
	b=B7Lme6qbF33c8P0DBm35WdvwjDbta+vfnyilAbGRChW1gwog/Cc/mbKyWF8j2BQ/FxtzbZ
	oom+Aatpx2sKgWCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB11813AAA;
	Mon, 17 Jun 2024 10:59:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CeU6MR4XcGZbEwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 17 Jun 2024 10:59:42 +0000
Message-ID: <b97972d6-fcb5-44ef-850a-6f7f3a703b5b@suse.cz>
Date: Mon, 17 Jun 2024 12:59:42 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Greg KH <greg@kroah.com>, Thorsten Leemhuis <linux@leemhuis.info>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com>
 <ZmruqWDTG2PK-rbu@sashalap>
 <dea93a79fc457d8a5424a18f8c138a4f75def064.camel@HansenPartnership.com>
 <2024061305-swimming-politely-30f3@gregkh>
 <78bfcb1f27462d160457b36f302ae4e12083493a.camel@HansenPartnership.com>
 <ZmyQUqQ5ZFLuR7YX@sashalap>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSBWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBzdXNlLmN6PsLBlAQTAQoAPgIbAwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBKlA1DSZLC6OmRA9UCJPp+fMgqZkBQJkBREIBQkRadznAAoJECJPp+fMgqZkNxIQ
 ALZRqwdUGzqL2aeSavbum/VF/+td+nZfuH0xeWiO2w8mG0+nPd5j9ujYeHcUP1edE7uQrjOC
 Gs9sm8+W1xYnbClMJTsXiAV88D2btFUdU1mCXURAL9wWZ8Jsmz5ZH2V6AUszvNezsS/VIT87
 AmTtj31TLDGwdxaZTSYLwAOOOtyqafOEq+gJB30RxTRE3h3G1zpO7OM9K6ysLdAlwAGYWgJJ
 V4JqGsQ/lyEtxxFpUCjb5Pztp7cQxhlkil0oBYHkudiG8j1U3DG8iC6rnB4yJaLphKx57NuQ
 PIY0Bccg+r9gIQ4XeSK2PQhdXdy3UWBr913ZQ9AI2usid3s5vabo4iBvpJNFLgUmxFnr73SJ
 KsRh/2OBsg1XXF/wRQGBO9vRuJUAbnaIVcmGOUogdBVS9Sun/Sy4GNA++KtFZK95U7J417/J
 Hub2xV6Ehc7UGW6fIvIQmzJ3zaTEfuriU1P8ayfddrAgZb25JnOW7L1zdYL8rXiezOyYZ8Fm
 ZyXjzWdO0RpxcUEp6GsJr11Bc4F3aae9OZtwtLL/jxc7y6pUugB00PodgnQ6CMcfR/HjXlae
 h2VS3zl9+tQWHu6s1R58t5BuMS2FNA58wU/IazImc/ZQA+slDBfhRDGYlExjg19UXWe/gMcl
 De3P1kxYPgZdGE2eZpRLIbt+rYnqQKy8UxlszsBNBFsZNTUBCACfQfpSsWJZyi+SHoRdVyX5
 J6rI7okc4+b571a7RXD5UhS9dlVRVVAtrU9ANSLqPTQKGVxHrqD39XSw8hxK61pw8p90pg4G
 /N3iuWEvyt+t0SxDDkClnGsDyRhlUyEWYFEoBrrCizbmahOUwqkJbNMfzj5Y7n7OIJOxNRkB
 IBOjPdF26dMP69BwePQao1M8Acrrex9sAHYjQGyVmReRjVEtv9iG4DoTsnIR3amKVk6si4Ea
 X/mrapJqSCcBUVYUFH8M7bsm4CSxier5ofy8jTEa/CfvkqpKThTMCQPNZKY7hke5qEq1CBk2
 wxhX48ZrJEFf1v3NuV3OimgsF2odzieNABEBAAHCwXwEGAEKACYCGwwWIQSpQNQ0mSwujpkQ
 PVAiT6fnzIKmZAUCZAUSmwUJDK5EZgAKCRAiT6fnzIKmZOJGEACOKABgo9wJXsbWhGWYO7mD
 8R8mUyJHqbvaz+yTLnvRwfe/VwafFfDMx5GYVYzMY9TWpA8psFTKTUIIQmx2scYsRBUwm5VI
 EurRWKqENcDRjyo+ol59j0FViYysjQQeobXBDDE31t5SBg++veI6tXfpco/UiKEsDswL1WAr
 tEAZaruo7254TyH+gydURl2wJuzo/aZ7Y7PpqaODbYv727Dvm5eX64HCyyAH0s6sOCyGF5/p
 eIhrOn24oBf67KtdAN3H9JoFNUVTYJc1VJU3R1JtVdgwEdr+NEciEfYl0O19VpLE/PZxP4wX
 PWnhf5WjdoNI1Xec+RcJ5p/pSel0jnvBX8L2cmniYnmI883NhtGZsEWj++wyKiS4NranDFlA
 HdDM3b4lUth1pTtABKQ1YuTvehj7EfoWD3bv9kuGZGPrAeFNiHPdOT7DaXKeHpW9homgtBxj
 8aX/UkSvEGJKUEbFL9cVa5tzyialGkSiZJNkWgeHe+jEcfRT6pJZOJidSCdzvJpbdJmm+eED
 w9XOLH1IIWh7RURU7G1iOfEfmImFeC3cbbS73LQEFGe1urxvIH5K/7vX+FkNcr9ujwWuPE9b
 1C2o4i/yZPLXIVy387EjA6GZMqvQUFuSTs/GeBcv0NjIQi8867H3uLjz+mQy63fAitsDwLmR
 EP+ylKVEKb0Q2A==
In-Reply-To: <ZmyQUqQ5ZFLuR7YX@sashalap>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.50 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DAD943806F
X-Spam-Flag: NO
X-Spam-Score: -4.50
X-Spam-Level: 

On 6/14/24 8:47 PM, Sasha Levin wrote:
> On Thu, Jun 13, 2024 at 11:11:54AM -0400, James Bottomley wrote:
>>On Thu, 2024-06-13 at 16:02 +0200, Greg KH wrote:
>>> On Thu, Jun 13, 2024 at 09:56:56AM -0400, James Bottomley wrote:
>>> > On Thu, 2024-06-13 at 09:06 -0400, Sasha Levin wrote:
>>[...]
>>> > > Could you provide a concrete example? This shouldn't happen.
>>> >
>>> > This one has no fixes or cc stable:
>>> >
>>> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=37f1663c91934f664fb850306708094a324c227c
>>> >
>>> > Yet here it is backported:
>>> >
>>> > Message-id: 20240603121056.1837607-1-sashal@kernel.org
>>> >
>>> > (I can't give a lore reference because conveniently it was a
>>> > personal cc with no tracked mailing list).
>>> >
>>> > I picked that one because we discovered a bug with the strlcpy to
>>> > strscpy conversions in SCSI which it looks like this backport has.
>>>
>>> It says, in the commit message:
>>>          Stable-dep-of: c3408c4ae041 ("scsi: qla2xxx: Avoid possible
>>> run-time warning with long model_num")
>>>
>>> That is why it was backported.
>>
>>Well, that still tracks back to a patch which wasn't tagged:
>>c3408c4ae041 is actually fixing a bug in 527e9b704c3d which is another
>>of the strlcpy to strscpy patches which also has no cc:stable or fixes
>>tag:
>>
>>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=527e9b704c3d
> 
> Nor was it ever backported to any stable tree... What am I missing?

What I'm missing is why 37f1663c919 was backported with "Stable-dep-of:
c3408c4ae041" while c3408c4ae041 was not backported?

