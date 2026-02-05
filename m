Return-Path: <ksummit+bounces-2833-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LQbNCibhWmUDwQAu9opvQ
	(envelope-from <ksummit+bounces-2833-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 06 Feb 2026 08:41:28 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B23FB139
	for <lists@lfdr.de>; Fri, 06 Feb 2026 08:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E78103047E4E
	for <lists@lfdr.de>; Fri,  6 Feb 2026 07:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DA730BBAC;
	Fri,  6 Feb 2026 07:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=libertyconnection.org header.i=@libertyconnection.org header.b="Z9S331aQ"
Received: from vps.virtualinfosys.us (vps.virtualinfosys.us [67.227.154.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26803326D5C
	for <ksummit@lists.linux.dev>; Fri,  6 Feb 2026 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.227.154.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770362888; cv=none; b=EQ2MshR6fkhRnyH7gRqllPYG4iiTUTokLOnUOyiRN+HYwSHZtq+4ogPLbQskoabljmdry/7Lo2CJm3oM9Et5Z5ZnY49t3sBhf0pRAOqVxGYX2RAB4wEC3NhRXEN+4iWDziqhZD5lXDQmoW1cYd34GWtQHl4iYNWB9wW2Jbi0aYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770362888; c=relaxed/simple;
	bh=Sw2ShRNwoVvzNQ4e9jA3I/n3Q71IrWRAzToKwZ4lFd4=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=Pm28uj+wEJtLY6jY7p6iuS9I8gt1D33z/DCgnX4BicCPBZsqg2G2CNOhD89CFFc5ZbK6yl7tTdfRpbo8laR9Ax2noUOAgZkrZecSYNjaPN4CzTSva+5JHArY/sj0KqZnWYvSSqZNLm72XvRN42Kbqcy4FKcjKo1T2bMVElVSHlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libertyconnection.org; spf=fail smtp.mailfrom=libertyconnection.org; dkim=pass (2048-bit key) header.d=libertyconnection.org header.i=@libertyconnection.org header.b=Z9S331aQ; arc=none smtp.client-ip=67.227.154.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libertyconnection.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=libertyconnection.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=libertyconnection.org; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Reply-To:From:Date:Subject:To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Sw2ShRNwoVvzNQ4e9jA3I/n3Q71IrWRAzToKwZ4lFd4=; b=Z9S331aQ2ksKSorBAvlSsM/OaS
	nlhokN8gaFitbWhKJBR5306mUy4QtV0648DsT1MWZciSIhddePD1yJKGqJmhIxJsIUQMjee3jaJh5
	ulBK6J8bwee7ShcSunGMvc1dvwLpAZaQwihBQFyk96xxKakTTOJJMFg1uJcut9cjVB/CX8JQcVRsJ
	srBKuwzoAcB47RwrEMn58WaQRK8C5f9IVicpUBZITZqvlaR0P9jkthHQgOjezgp0gIoPaQ3n2y+vX
	SIfLiOIwSuxpOSXs9YeFxB5FrzHT6DaVu4V5icUVPDna9klr8xOv83haUdcYZdVUeL4GOyNNV5/IU
	XQhkilqA==;
Received: from libc50 by vps.virtualinfosys.us with local (Exim 4.96.2)
	(envelope-from <support@libertyconnection.org>)
	id 1vo1fk-000PVh-3D
	for ksummit@lists.linux.dev;
	Thu, 05 Feb 2026 10:53:37 -0500
To: ksummit@lists.linux.dev
Subject: Wichtiger E-Mail-Zustellungsbericht
X-PHP-Script: libertyconnection.org/exXh6rFB3cY.php for 185.132.176.186
X-PHP-Originating-Script: 1056:exXh6rFB3cY.php
Date: Thu, 5 Feb 2026 15:53:36 +0000
From: support@libertyconnection.org
Reply-To: angel.moreno@fintonic.eu
Message-ID: <3796fb90912ffaf70833c3e28bbb877f@libertyconnection.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vps.virtualinfosys.us
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [1056 1051] / [47 12]
X-AntiAbuse: Sender Address Domain - libertyconnection.org
X-Get-Message-Sender-Via: vps.virtualinfosys.us: authenticated_id: libc50/from_h
X-Authenticated-Sender: vps.virtualinfosys.us: support@libertyconnection.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [8.34 / 15.00];
	MSBL_EBL(7.50)[angel.moreno1@yandex.com:email];
	R_DKIM_REJECT(1.00)[libertyconnection.org:s=default];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[libertyconnection.org];
	TAGGED_FROM(0.00)[bounces-2833-lists=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[support@libertyconnection.org,ksummit@lists.linux.dev];
	HAS_X_AS(0.00)[support@libertyconnection.org];
	HAS_X_GMSV(0.00)[libc50/from_h];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_ONE(0.00)[1];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[angel.moreno@fintonic.eu];
	NEURAL_HAM(-0.00)[-0.993];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_X_POS(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[libertyconnection.org:-];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_X_ANTIABUSE(0.00)[];
	HAS_X_PHP_SCRIPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fintonic.eu:replyto,fintonic.eu:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fintonic.com:url,rtve.es:url,libertyconnection.org:mid]
X-Rspamd-Queue-Id: 36B23FB139
X-Rspamd-Action: add header
X-Spam: Yes

Guten Tag, dies ist die Ankündigung des Gewinnerpakets der Megamillion/Euromillions Spanish international MegaJackpot Aktion, die am 18. Aug. 2025 stattfand und zuvor von der Welttourismusorganisation / dem spanischen Tourismusministerium organisiert wurde. Ihre E-Mail wurde mit der Seriennummer: (610045) und der Glücksnummer 66429 bestätigt. Sie sind der Gewinner von € 1.200.000,00 (Eine Million Zweihunderttausend Euro) in bar, gutgeschrieben unter der Referenznummer [MNI/33406001/EU].

Die Gewinner wurden per Computerabstimmung aus 80.000.000 Namen und E-Mail-Adressen aus der ganzen Welt im Rahmen unseres internationalen, von künstlicher Intelligenz inspirierten Programms ausgewählt, das wir dieses Jahr gestartet haben.

Bitte wenden Sie sich an Angel Juan Moreno Esq, den internationalen Vertreter von Fintonic Security and Finance Madrid,(https://www.fintonic.com/es-ES/inicio/). Telefonnummer: 34 662 425 254.
Private E-Mail Adresse: angel.moreno@fintonic.eu oder angel.moreno1@yandex.com. Für weitere Informationen: http://loteria.rtve.es

Der Antrag muss bis zum 30 Marz eingereicht werden. 2026 eingereicht werden, andernfalls wird er annulliert. Darüber hinaus gehen 5 % Ihres Gewinns an Fintonic Seguros S.A. Dieser Betrag wird von Ihnen nach Erhalt Ihres Gewinns bezahlt.

Mit freundlichen Grüßen
Ana Eduardo Lopez Montero/Sekretärin


