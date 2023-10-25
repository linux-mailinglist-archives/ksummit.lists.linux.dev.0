Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D69667D767E
	for <lists@lfdr.de>; Wed, 25 Oct 2023 23:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 399D6B211F1
	for <lists@lfdr.de>; Wed, 25 Oct 2023 21:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D2C339B1;
	Wed, 25 Oct 2023 21:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qzMRiwVp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sRtfenvo"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCE412B6D;
	Wed, 25 Oct 2023 21:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D02FA1F750;
	Wed, 25 Oct 2023 21:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1698268747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a9Af+NllnQs6WDAqzhEpmdQJ8FHXXJVHndKPVn2t9dM=;
	b=qzMRiwVphQzMRJiFAaB5c/JJBQrI0AZ3fe/bcfd420SPuUShIF5HYFwK4j09teueomdaZs
	rhpqZSLHnfc++Uex/CHlj4bB1A9hn5ugsB7CV6l/0ce9YAtkoCoJ7WMuOnUglhkUgKKiqr
	ndYXuaPZsyoWwYVtKOgphBT73fZQYFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698268747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a9Af+NllnQs6WDAqzhEpmdQJ8FHXXJVHndKPVn2t9dM=;
	b=sRtfenvoQPaOCv7oyce4CK8JhTUA89fdRlGv9NKGtC+/6F6Cyf4v/fJSCQKUaUPDNeqakO
	2qBuaEVTVRB7P2Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4A78138E9;
	Wed, 25 Oct 2023 21:19:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ybD3FkiGOWXqMAAAMHmgww
	(envelope-from <neilb@suse.de>); Wed, 25 Oct 2023 21:19:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: "Steven Rostedt" <rostedt@goodmis.org>,
 "James Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Jani Nikula" <jani.nikula@intel.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Dan Carpenter" <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
 outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
In-reply-to:
 <CAHk-=wj_4VNHeNmRJ_DeD7RDZFvPCQxVR1O2RwFAOG7Gb7OYYg@mail.gmail.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>,
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>,
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>,
 <169818295461.20306.14022136719064683486@noble.neil.brown.name>,
 <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>,
 <87fs1y8xkl.fsf@intel.com>,
 <893b8cc27684a03865dbf9517a4cbf1bd132950a.camel@HansenPartnership.com>,
 <20231025141030.63acb006@gandalf.local.home>,
 <CAHk-=wj_4VNHeNmRJ_DeD7RDZFvPCQxVR1O2RwFAOG7Gb7OYYg@mail.gmail.com>
Date: Thu, 26 Oct 2023 08:19:01 +1100
Message-id: <169826874162.20306.1050865157734318774@noble.neil.brown.name>

On Thu, 26 Oct 2023, Linus Torvalds wrote:
> On Wed, 25 Oct 2023 at 08:10, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > I think this is the key issue. We only want the context of an email that =
is
> > being responded to present, and the rest trimmed. Automated trimming or
> > collapsing doesn't do this well.
>=20
> It's not just about MUA's that hide things. The MUA _I_ use hides
> excessive quoting, but then when I look at the results on lore I often
> get completely unreadable results because somebody quoted several
> hundred lines of patch or whatever. And then I scrolling through the
> thread is suddenly a major PITA.

So you don't think that lore is an MUA?
If lore didn't summaries the headers, that would be a bug.
But that fact that it doesn't summarise the quotes isn't?

NeilBrown


>=20
> So I do think that the whole excessive quoting on the lists should
> just be a hard no, the same way html is.
>=20
>                  Linus
>=20


