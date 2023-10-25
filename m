Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEECE7D768C
	for <lists@lfdr.de>; Wed, 25 Oct 2023 23:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81669281DD2
	for <lists@lfdr.de>; Wed, 25 Oct 2023 21:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7D034186;
	Wed, 25 Oct 2023 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JBhq8sSa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cBmRbNRn"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A527C12B6D;
	Wed, 25 Oct 2023 21:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 559A320129;
	Wed, 25 Oct 2023 21:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1698268673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KgLiS+cPjCEsAYdLVYLCPsaal9PqLcfEx5CqPhxTSxo=;
	b=JBhq8sSa0ck8iCnLjUOs1DpLY+SVifg1tpTtRM/WhyzK8gwME+Nbl33sIPMy0ngeIwpO60
	4nUYrMyFhdOeeCuDO+M3+2rl4Pzsv7P7FYdgKJ07SyBeHqUTyLpJYSPazKhCSgn6zIyN2h
	DjKHGwUhsSnlRDp9JYS2bnX63sHnBf8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698268673;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KgLiS+cPjCEsAYdLVYLCPsaal9PqLcfEx5CqPhxTSxo=;
	b=cBmRbNRnpaixZ/AmO1r+Yv3hTf3BLLNFXg3pdWFEWrpNor3o/DuStHdFvkU+ApwfWTYrwS
	qGwCreBV54BOtgCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6AE95138E9;
	Wed, 25 Oct 2023 21:17:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Y1HvCP6FOWWSMAAAMHmgww
	(envelope-from <neilb@suse.de>); Wed, 25 Oct 2023 21:17:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Steven Rostedt" <rostedt@goodmis.org>
Cc: "James Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Jani Nikula" <jani.nikula@intel.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Dan Carpenter" <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
 outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
In-reply-to: <20231025141030.63acb006@gandalf.local.home>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>,
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>,
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>,
 <169818295461.20306.14022136719064683486@noble.neil.brown.name>,
 <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>,
 <87fs1y8xkl.fsf@intel.com>,
 <893b8cc27684a03865dbf9517a4cbf1bd132950a.camel@HansenPartnership.com>,
 <20231025141030.63acb006@gandalf.local.home>
Date: Thu, 26 Oct 2023 08:17:47 +1100
Message-id: <169826866742.20306.11983020557594162413@noble.neil.brown.name>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -5.25
X-Spamd-Result: default: False [-5.25 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.15)[88.73%]
X-Spam-Flag: NO

On Thu, 26 Oct 2023, Steven Rostedt wrote:
> On Wed, 25 Oct 2023 14:07:02 -0400
> James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> > Because some MUAs don't have it.  Others are a bit aggressive, meaning
> > you have to turn it off anyway if you want to see what's in more than a
> > couple of lines of a quote (it only takes me a couple of emails to get
> > incredibly annoyed with the way gmail does it, for instance, since it
> > never seems to leave enough useful context).
> 
> I think this is the key issue. We only want the context of an email that is
> being responded to present, and the rest trimmed. Automated trimming or
> collapsing doesn't do this well.

Who exactly is "We"?  I don't think your description matches what I
want.

NeilBrown

> 
> Maybe we can make AI do this for us.. hmm
> 
> -- Steve
> 


