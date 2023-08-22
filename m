Return-Path: <ksummit+bounces-1045-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B42783C75
	for <lists@lfdr.de>; Tue, 22 Aug 2023 11:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96ECA1C20AA0
	for <lists@lfdr.de>; Tue, 22 Aug 2023 09:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BB58F56;
	Tue, 22 Aug 2023 09:05:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5DC79C8
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 09:05:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9614D1F381;
	Tue, 22 Aug 2023 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1692695135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esTm+gNxfKja+OBXRhReam2Fh4p27Bp2mu2ER9sOPkE=;
	b=Mtmr19fHsfItiGqHOo70WuhiDtoDlpFVEf3tCoQxsOJNfxN1ZIytFsf6mryvEJxKN+Tbn7
	OHLrO3wxUDRH+OS0XjIziEgtVXCqUn5D2FeQipX3l8nlqovlRRxot+CaJRCq8hs8vEINa3
	s+xIhDis4QDnM1uHAKrryPCpBQbXpMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692695135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esTm+gNxfKja+OBXRhReam2Fh4p27Bp2mu2ER9sOPkE=;
	b=hFiHWIFH/jWBn6+Rl9f2rCrmnpqerjqnHl/g2nNqin1KQZxt5oL472KND+wSlTXY68ktsH
	9Bll/77RrVdTTiAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F2D67132B9;
	Tue, 22 Aug 2023 09:05:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YSomNF165GQufAAAMHmgww
	(envelope-from <hare@suse.de>); Tue, 22 Aug 2023 09:05:33 +0000
Message-ID: <30c87cc1-4b9b-6f8f-361c-aa814e750ee7@suse.de>
Date: Tue, 22 Aug 2023 11:05:32 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Content-Language: en-US
To: Jiri Kosina <jikos@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Leon Romanovsky <leon@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jakub Kicinski <kuba@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Luis Chamberlain <mcgrof@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
 Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com>
 <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org>
 <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <20230819064537.GM22185@unreal>
 <20230821153549.GJ10135@pendragon.ideasonboard.com>
 <nycvar.YFH.7.76.2308220938500.14207@cbobk.fhfr.pm>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <nycvar.YFH.7.76.2308220938500.14207@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/22/23 09:41, Jiri Kosina wrote:
> On Mon, 21 Aug 2023, Laurent Pinchart wrote:
> 
>>> It is not clear to me how to get honest answers without fear of
>>> loosing an ability to work with that subsystems later.
>>
>> One straightforward (on paper) option is to guarantee anonymity. When I
>> was in university, students were given the opportunity to provide
>> feedback on teachers, and the feedback was aggregated into a report that
>> didn't contain any personal information that could be used to identify
>> the students.
> 
> I understand where you are coming from with this (my university did the
> same :) ), but in my view this has a huge potential for not really
> reflecting reality. Rationale being: the people who e.g. got their code
> rejected will naturally tend to provide negative feedback, even if
> rejecting the code was objectively the right thing to do.
> 
> And vice versa.
> 
I do see the advantage, but the main disadvantage here is that it's 
eroding trust between people. Anonymous review tends to be used for
negative feedback, and I am aware that negative feedback to maintainers
can have a direct impact on your ability to work in that subsystem
(and believe me, I have been in that position. Several times.)
But in the end if you want to continue to work in that subsystem
you have to come to some sort of arrangement here.
I do believe that our maintainers are capable of differentiating
between personal and technical issues, so it should be possible
to work together despite personal ... (issues? differences?).

But none of the above will work if the feedback is anonymously.
Maintainer will have a reason for reacting that way, and won't
be able to explain themselves properly if they don't know whom
to address.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


