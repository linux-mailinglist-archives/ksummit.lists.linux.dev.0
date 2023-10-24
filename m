Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF9C7D5D37
	for <lists@lfdr.de>; Tue, 24 Oct 2023 23:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 923E4281ABE
	for <lists@lfdr.de>; Tue, 24 Oct 2023 21:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B7A3F4DB;
	Tue, 24 Oct 2023 21:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rQVRqxIn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d3SZ/AhF"
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E48B39940;
	Tue, 24 Oct 2023 21:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B032521C8D;
	Tue, 24 Oct 2023 21:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1698182959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2n61CgsiXsrQYGPMe+vk8J3/9XYVbLRDpTEs3FhuK4A=;
	b=rQVRqxIn3pBBpF/BK43wGmDLSme430KI+BcAUXwfEjYoMJA8lM6K38RvlSNLomXGIIP524
	WLmKAQ29jgQU6d/D7ReLW/csP0aFGh6YEysZWW4fAz/KnY9f9lPhrqlEroJjrJCczZMN2A
	UHZyIuq2Tgcq1yWp+vR+9Y8Hq7s47oc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698182959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2n61CgsiXsrQYGPMe+vk8J3/9XYVbLRDpTEs3FhuK4A=;
	b=d3SZ/AhFThSoyMYDauSWEIsQwzAPo/qJUlS9qp2YBU+g/NW7xXTeqiyOn45/nn49p5ybuq
	yMF5VqqHYOatA3Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 992D3134F5;
	Tue, 24 Oct 2023 21:29:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id JMY9FC03OGX2cgAAMHmgww
	(envelope-from <neilb@suse.de>); Tue, 24 Oct 2023 21:29:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "Dan Carpenter" <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
 outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
In-reply-to: <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>,
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>,
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
Date: Wed, 25 Oct 2023 08:29:14 +1100
Message-id: <169818295461.20306.14022136719064683486@noble.neil.brown.name>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -8.10
X-Spamd-Result: default: False [-8.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[43.84%]
X-Spam-Flag: NO

On Wed, 25 Oct 2023, Krzysztof Kozlowski wrote:
> On 23/10/2023 20:49, Andrew Morton wrote:
> > On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter <dan.carpenter@linaro.or=
g> wrote:
> >=20
> >> Yesterday someone on my lists just sent an email looking for kernel
> >> tasks.=20
> >=20
> > Well here's a task: write a bot which follows the mailing lists and
> > sends people nastygrams if one of their emails is more than 95%(?)
> > quoted text.
> >=20
> > It's happening significantly more lately.  Possibly because the gmail
> > client helpfully hides quoted text.
>=20
> I would also point to reviewers and maintainers who give a Rb/Ack tag:
> 1. somewhere at the top, without any footer like Best regards, and then
> quote entire patch, so I don't know shall I look for more comments after
> Rb/Ack?
>=20
> 2. quote entire email and then add Rb/Ack, so I need to figure out
> whether there was something between the hundreds of lines of text or not.

Here we all are, brilliantly talented computer programmers who spend
our days making amazing fast digital devices do amazingly clever and
subtle things, inventing time-saving tools and processing vast amounts
of data without blinking, but for some reason we think the task of
skipping over a few thousand lines that all start with '> " is too hard
for us and that we should, in stead, complain to some other human to
convince them to make our life easier for us.

Does anyone else see the irony?

NeilBrown

