Return-Path: <ksummit+bounces-684-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A77556EDF
	for <lists@lfdr.de>; Thu, 23 Jun 2022 01:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB915280BF8
	for <lists@lfdr.de>; Wed, 22 Jun 2022 23:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E111C2C;
	Wed, 22 Jun 2022 23:13:38 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2557D3C23
	for <ksummit@lists.linux.dev>; Wed, 22 Jun 2022 23:13:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F072421B71;
	Wed, 22 Jun 2022 23:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1655939608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADcSMs+MKFhvve0WmBuvWDt2iFgA9u9HTK5rDbc8z2k=;
	b=p3aI0Fenop4yT556KbNkn5ErsTo2UKcRLoj0gefUWj9XTJZmpHQwejgfgMDRskllVD1KHB
	ndU5vWzI76VC+qwXuPSygzF1fM2HGkFlW8RiytjXJdhF3e1jKY283X2LVnt8B4IZ91yLpd
	Fhy5C/JECZuQ93kyEZOGDwgSzRO95u4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1655939608;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADcSMs+MKFhvve0WmBuvWDt2iFgA9u9HTK5rDbc8z2k=;
	b=yjCksfFs+G7gGAm/2Wl6G+XDiO3za1EEVEGApQrdrLKM9z9AUlcPIcjJCO0rTwij5IKdw4
	wg0VKubLRsWy51Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B4862134A9;
	Wed, 22 Jun 2022 23:13:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id NBmaGxais2IVJwAAMHmgww
	(envelope-from <nfbrown@suse.de>); Wed, 22 Jun 2022 23:13:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: NeilBrown <nfbrown@suse.de>
To: "James Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 "Jens Axboe" <axboe@kernel.dk>, "Christoph Hellwig" <hch@infradead.org>,
 "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 "ksummit" <ksummit-discuss@lists.linuxfoundation.org>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Are we becoming too fearful? [was Re: [TECH
 TOPIC] Rust]
In-reply-to:
 <ca6243160b36aa42f4d0ad23853b84e57ca366f1.camel@HansenPartnership.com>
References:
 <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>,
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>,
 <Yq6+p+aRCjeZ7QsS@infradead.org>,
 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>,
 <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>,
 <d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk>,
 <Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>,
 <cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>,
 <ca6243160b36aa42f4d0ad23853b84e57ca366f1.camel@HansenPartnership.com>
Date: Thu, 23 Jun 2022 09:13:22 +1000
Message-id: <165593960233.4786.4776751165554098218@noble.neil.brown.name>

On Mon, 20 Jun 2022, James Bottomley wrote:
> 
> I think there's a growing problem in Linux which is exemplified by this
> Rust debate but which goes way beyond it: We're becoming too fearful of
> making big decisions to sustain innovation in some areas.  This really
> is a creeping cancer of inertia that has destroyed many projects before
> us and if we're not careful, we'll go the same way.

Is this because Linux is just too big?  Are we squeezing too much into
one project, and becoming afraid to push on one piece for fear of
breaking another?

Of course, breaking Linux into separate pieces would mean we would need
to create APIs that were at least a little bit stable.  But it might
also mean that individual sub-projects could take risks and either
flourish or die without an undue impact on the rest of the ecosystem.

NeilBrown

