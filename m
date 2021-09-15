Return-Path: <ksummit+bounces-579-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 112CF40C8B1
	for <lists@lfdr.de>; Wed, 15 Sep 2021 17:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 399561C0D52
	for <lists@lfdr.de>; Wed, 15 Sep 2021 15:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C99A3FD9;
	Wed, 15 Sep 2021 15:49:45 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724C429CA
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 15:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Wh5enwv0q3T6plDf5AFiVoXl9LkOcmja36omfE/zBKQ=;
	t=1631720983; x=1632930583; b=Gt4/yTewa7OQs7Q1f0+BQTJ6PA0VzGuuhU9pa9ynOAsHxB4
	kBIDoSv8sQ2q/P7ubKP2x2gKv/sOagqifMlukIj95w5go+E52JXdylzPsKSF67GlJXsWYo8tZBIb+
	xzUeFUDTUuhSNxentdTkEaG4sdIGZ7Y4ChHHtUmRPQ/7qCQBIfypR3Pf7HDRCkXE5sTmBa9KK9s0Y
	UJYwX3TefbPGPXA/Qs7MEUS+cFaZ217Mll2bJ8gL+7Xq4u/V2FvjaV6c6FwRlZjeNqVTtLlTJw6Cd
	XM70l2SyTZ7B2jHitZK7YFsdaF4nUiH/V8ebzr1dKowy2Qwg60DWKiitZW1iAY+w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95-RC2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1mQXAD-007MvQ-HC;
	Wed, 15 Sep 2021 17:49:33 +0200
Message-ID: <6db59b8a4874b60cab7069fd06d180c2601bb427.camel@sipsolutions.net>
Subject: Re: Reminder: Voting procedures for the Linux Foundation Technical
 Advisory Board
From: Johannes Berg <johannes@sipsolutions.net>
To: Laura Abbott <laura@labbott.name>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: ksummit@lists.linux.dev, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, 
	"tech-board-discuss@lists.linuxfoundation.org"
	 <tech-board-discuss@lists.linuxfoundation.org>
Date: Wed, 15 Sep 2021 17:49:32 +0200
In-Reply-To: <dc45975a-86df-a70d-ff15-58a3bdcf09ee@labbott.name>
References: <fccbdadc-a57a-f6fe-68d2-0fbac2fd6b81@labbott.name>
	 <b90db9e7-9b6b-c415-d087-3505ba0be0d6@labbott.name>
	 <YUH+DO5aHWGVdNb7@pendragon.ideasonboard.com>
	 <dc45975a-86df-a70d-ff15-58a3bdcf09ee@labbott.name>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned

On Wed, 2021-09-15 at 10:36 -0400, Laura Abbott wrote:
> 
> I did make an attempt to send e-mails to the > 50 commits individuals

So if we got the "look for your ballot" email from you, that means we're
on the list?

I agree with Laurent, it's a bit confusing now to figure out whether we
should request or not, and if we have to request before the automated
ones are sent out, we can't wait for that either.

I'm sure I'm on the list, but I guess others aren't quite so sure.

johannes


